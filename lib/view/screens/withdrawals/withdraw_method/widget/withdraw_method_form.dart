import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';

class WithdrawMethodForm extends StatefulWidget {

  const WithdrawMethodForm({Key? key}) : super(key: key);

  @override
  State<WithdrawMethodForm> createState() => _WithdrawMethodFormState();
}

class _WithdrawMethodFormState extends State<WithdrawMethodForm> {

  var selectMethod = "Select Method";
  List<String> methodItems = ["Select Method", "xCash", "Paypal", "Payoneer"];

  var selectCurrency = "Select Currency";
  List<String> currencyItems = ["Select Currency", "USD", "EUR", "BTC", "NGN", "BDT", "IDR", "GBP"];

  bool isVisible = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDownTextField(
              labelText: MyStrings.selectMethod,
              selectedValue: selectMethod,
              onChanged: (value){
                if(value == "Select Method"){
                  isVisible = false;
                  isVisible2 = false;
                }
                else if(value == "xCash" || value == "Paypal"){
                  isVisible = true;
                  isVisible2 = false;
                }
                else{
                  isVisible2 = true;
                  isVisible = false;
                }

                setState(() {
                  selectMethod = value.toString();
                });
              },
              items: methodItems.map((String val){

                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                    style: interRegularSmall,
                  ),
                );
              }).toList(),
          ),

          const SizedBox(height: Dimensions.space15),

          CustomDropDownTextField(
            labelText: MyStrings.selectCurrency,
            selectedValue: selectCurrency,
            onChanged: (value){
              setState(() {
                selectCurrency = value.toString();
              });
            },
            items: currencyItems.map((String val){
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                  style: interRegularSmall,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: Dimensions.space15),

          CustomTextFormField(
              labelText: MyStrings.provideNickName,
              hintText: "Enter ${MyStrings.provideNickName.toLowerCase()}",
              onChanged: (value){}
          ),

          Visibility(
            visible: isVisible,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.space15),

                CustomTextFormField(
                    labelText: "Account No.",
                    hintText: "Enter account no.",
                    onChanged: (value){}
                ),

                const SizedBox(height: Dimensions.space15),

                CustomTextFormField(
                    labelText: MyStrings.email,
                    hintText: "Enter ${MyStrings.email.toLowerCase()}",
                    onChanged: (value){}
                ),
              ],
            ),
          ),

          Visibility(
            visible: isVisible2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.space15),
                CustomTextFormField(
                    labelText: "Payoneer Email",
                    hintText: "Enter payoneer email",
                    onChanged: (value){}
                )
              ],
            ),
          ),

          const SizedBox(height: Dimensions.space25),

          CustomAnimatedButton(
              onTap: (){},
              height: 45,
              width: MediaQuery.of(context).size.width,
              backgroundColor: MyColor.primaryColor,
              child: Text(MyStrings.addWithdrawMethod, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500))
          ),
        ],
      ),
    );
  }
}

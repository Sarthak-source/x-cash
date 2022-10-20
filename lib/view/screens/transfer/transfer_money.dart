import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {

  var selectedValue = "Select One";
  List<String> items = ["Select One", "USD", "NGN", "BDT", "ETH"];
  int selectedCard = 0;

  var selectOtp = "Select OTP Type";
  List<String> otpItems = ["Select OTP Type", "Email", "Sms"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BottomSheetHeaderText(text: MyStrings.transferMoney),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 30, width: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(color: MyColor.primaryColor100, shape: BoxShape.circle),
                child: const Icon(Icons.clear, color: MyColor.colorBlack, size: 15),
              ),
            )
          ],
        ),

        const CustomDivider(),

        Form(
          child: Column(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownTextField(
                      labelText: MyStrings.selectWallet,
                      hintText: selectedValue,
                      selectedValue: selectedValue,
                      onChanged: (value){
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                      items: items.map((String val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: interRegularSmall,
                            )
                        );
                      }).toList(),
                  ),
                  const SizedBox(height: Dimensions.space10 / 2),
                  Text(MyStrings.chargeAmount, style: interRegularExtraSmall.copyWith(color: MyColor.primaryColor))
                ],
              ),

              const SizedBox(height: Dimensions.space15),

              CustomTextFormField(
                  labelText: MyStrings.agentUsernameEmail,
                  hintText: MyStrings.agentUsernameHint,
                  onChanged: (value){}
              ),

              const SizedBox(height: Dimensions.space15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAmountTextField(
                      labelText: MyStrings.amount,
                      hintText: MyStrings.amountHint,
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space10 / 2),
                  Text(MyStrings.min_max_Amount, style: interRegularExtraSmall.copyWith(color: MyColor.primaryColor))
                ],
              ),

              const SizedBox(height: Dimensions.space20),

              CustomDropDownTextField(
                  labelText: MyStrings.selectOtp,
                  hintText: selectOtp,
                  selectedValue: selectOtp,
                  onChanged: (value){
                    setState(() {
                      selectOtp = value.toString();
                    });
                  },
                  items: otpItems.map((String val){
                    return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: interRegularSmall,
                        )
                    );
                  }).toList()
              ),

              const SizedBox(height: Dimensions.space25),

              CustomAnimatedButton(
                  onTap: (){},
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: MyColor.primaryColor,
                  child: Text(MyStrings.transferNow, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        )
      ],
    );
  }
}

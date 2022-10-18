import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
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

              transferCardList(MyImages.mail, MyStrings.otpBySMS, 0),
              const SizedBox(height: Dimensions.space10),
              transferCardList(MyImages.email, MyStrings.otpByEmail, 1),
              const SizedBox(height: Dimensions.space10),
              transferCardList(MyImages.google, MyStrings.otpByGoogleAuth, 2),

              const SizedBox(height: Dimensions.space25),

              CustomAnimatedButton(
                  onTap: (){},
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: MyColor.primaryColor,
                  child: Text(MyStrings.transferNow, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w600)),
              )
            ],
          ),
        )
      ],
    );
  }

  transferCardList(String imageName, String title, int index) {

    return GestureDetector(

      onTap: (){
        setState(() {
          selectedCard = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: index == selectedCard ? MyColor.primaryColor : MyColor.lineColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    height: 30, width: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(Dimensions.space10 / 2),
                    decoration: const BoxDecoration(
                        color: MyColor.primaryColor100, shape: BoxShape.circle
                    ),
                    child: Image.asset(imageName, color: index == selectedCard ? MyColor.primaryColor : MyColor.colorBlack, height: 15, width: 15)
                ),
                const SizedBox(width: Dimensions.space10),
                Text(title, style: interRegularSmall.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
            Container(

              height: 20, width: 20,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(Dimensions.space10 / 5),
              decoration: BoxDecoration(

                  color: index == selectedCard ? MyColor.primaryColor : MyColor.lineColor, shape: BoxShape.circle
              ),
              child: const Icon(Icons.check, color: MyColor.colorWhite, size: 10),
            )
          ],
        ),
      ),
    );
  }
}

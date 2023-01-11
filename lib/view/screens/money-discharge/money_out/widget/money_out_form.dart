import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/money_discharge/money_out/money_out_controller.dart';
import 'package:xcash_app/data/model/money_discharge/money_out/money_out_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';

class MoneyOutForm extends StatefulWidget {
  const MoneyOutForm({Key? key}) : super(key: key);

  @override
  State<MoneyOutForm> createState() => _MoneyOutFormState();
}

class _MoneyOutFormState extends State<MoneyOutForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoneyOutController>(
      builder: (controller) => Form(
        key: formKey,
        child: controller.isLoading ? const CustomLoader() : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              needOutlineBorder: true,
              labelText: MyStrings.agentUsernameEmail,
              hintText: MyStrings.agentUsernameHint,
              onChanged: (value){},
              controller: controller.agentController,
              validator: (value) {
                if (value!.isEmpty) {
                  return MyStrings.fieldErrorMsg.tr;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimensions.space15),
            const LabelText(text: MyStrings.selectWallet),
            const SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
              decoration: BoxDecoration(
                  color: MyColor.transparentColor,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  border: Border.all(color: MyColor.primaryColor, width: 0.5)
              ),
              child: DropdownButton<Wallets>(
                dropdownColor: MyColor.colorWhite,
                value: controller.walletsMethod,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (Wallets? newValue) {
                  controller.setWalletMethod(newValue);
                },
                items: controller.walletList.map((Wallets wallet) {
                  return DropdownMenuItem<Wallets>(
                    value: wallet,
                    child: Text(wallet.currencyCode.toString(), style: regularDefault),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: Dimensions.space15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAmountTextField(
                  labelText: MyStrings.amount,
                  hintText: MyStrings.amountHint,
                  onChanged: (value){},
                  currency: controller.currency,
                  controller: controller.amountController,
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space15),
            const LabelText(text: MyStrings.selectOtp),
            const SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
              decoration: BoxDecoration(
                  color: MyColor.transparentColor,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  border: Border.all(color: MyColor.primaryColor, width: 0.5)
              ),
              child: DropdownButton(
                dropdownColor: MyColor.colorWhite,
                value: controller.initialOtpType,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (newValue) {
                  controller.setOtpMethod(newValue.toString());
                },
                items: controller.otpTypeList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.toString(), style: regularDefault),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: Dimensions.space20),
            controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
              press: (){
                if(formKey.currentState!.validate()){
                  CustomBottomSheet(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            BottomSheetHeaderText(text: MyStrings.paymentPreview),
                            BottomSheetCloseButton()
                          ],
                        ),
                        const CustomDivider(height: Dimensions.space15),
                      ],
                    )
                  ).customBottomSheet(context);
                }
              },
              text: MyStrings.moneyOut,
            )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/create_voucher_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';

import '../../../../../data/model/voucher/create_voucher_response_model.dart';

class CreateVoucherForm extends StatefulWidget {
  const CreateVoucherForm({Key? key}) : super(key: key);

  @override
  State<CreateVoucherForm> createState() => _CreateVoucherFormState();
}

class _CreateVoucherFormState extends State<CreateVoucherForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVoucherController>(
      builder: (controller) => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                value: controller.selectedWallet,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (Wallets? newValue) {
                  controller.setSelectedWallet(newValue);
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
                value: controller.selectedOtp,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (newValue) {
                  controller.setSelectedOtp(newValue.toString());
                },
                items: controller.otpTypeList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.toString(), style: regularDefault),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: Dimensions.space30),
            RoundedButton(
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
                          const CustomDivider(space: Dimensions.space15),
                          controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                            text: MyStrings.confirm,
                            press: (){
                              controller.submitCreateVoucher();
                            }
                          )
                        ],
                      )
                  ).customBottomSheet(context);
                }
              },
              text: MyStrings.createVoucher,
            )
          ],
        ),
      ),
    );
  }
}

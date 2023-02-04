import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
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
import 'package:xcash_app/view/screens/voucher/create_voucher/widget/create_voucher_bottom_sheet.dart';

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
            CustomDropDownTextField(
              labelText: MyStrings.selectWallet.tr,
              selectedValue: controller.selectedWallet,
              onChanged: (value) => controller.setSelectedWallet(value),
              items: controller.walletList.map((Wallets wallet) {
                return DropdownMenuItem<Wallets>(
                  value: wallet,
                  child: Text(wallet.currencyCode.toString(), style: regularDefault),
                );
              }).toList(),
            ),
            const SizedBox(height: Dimensions.space15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAmountTextField(
                  labelText: MyStrings.amount.tr,
                  hintText: MyStrings.amountHint,
                  onChanged: (value){
                    if(value.toString().isEmpty){
                      controller.changeInfoWidget(0);
                    }else{
                      double amount = double.tryParse(value.toString())??0;
                      controller.changeInfoWidget(amount);
                    }
                  },
                  currency: controller.currency,
                  controller: controller.amountController,
                ),
                const SizedBox(height: Dimensions.textToTextSpace),
                Text(
                  "${MyStrings.limit.tr}: ${controller.minLimit} - ${controller.maxLimit} ${controller.currency}",
                  style: regularExtraSmall.copyWith(color: MyColor.getPrimaryColor()),
                )
              ],
            ),
            const SizedBox(height: Dimensions.space15),
            CustomDropDownTextField(
              labelText: MyStrings.selectOtp.tr,
              selectedValue: controller.selectedOtp,
              onChanged: (value) => controller.setSelectedOtp(value),
              items: controller.otpTypeList.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.toString(), style: regularDefault),
                );
              }).toList(),
            ),
            const SizedBox(height: Dimensions.space30),
            RoundedButton(
              press: (){
                if(formKey.currentState!.validate()){
                  CustomBottomSheet(
                      child: const CreateVoucherBottomSheet()
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

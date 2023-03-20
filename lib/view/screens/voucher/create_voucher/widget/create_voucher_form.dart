import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/create_voucher_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/widget/create_voucher_bottom_sheet.dart';
import 'package:xcash_app/data/model/voucher/create_voucher_response_model.dart';

class CreateVoucherForm extends StatefulWidget {
  const CreateVoucherForm({Key? key}) : super(key: key);

  @override
  State<CreateVoucherForm> createState() => _CreateVoucherFormState();
}

class _CreateVoucherFormState extends State<CreateVoucherForm> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVoucherController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText(text: MyStrings.selectWallet),
          const SizedBox(height: Dimensions.textToTextSpace),
          FilterRowWidget(
              borderColor: controller.selectedWallet?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
              text: "${controller.selectedWallet?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedWallet?.currencyCode}",
              press: () => CustomBottomSheet(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BottomSheetHeaderRow(header: ''),
                    const SizedBox(height: Dimensions.space15),
                    ListView.builder(
                        itemCount: controller.walletList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              final controller= Get.find<CreateVoucherController>();
                              Wallets selectedValue = controller.walletList[index];
                              controller.setSelectedWallet(selectedValue);
                              Navigator.pop(context);

                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            },
                            child: BottomSheetCard(
                              child: Text(
                                controller.walletList[index].currencyCode.toString(),
                                style: regularDefault,
                              ),
                            ),
                          );
                        })
                  ],
                )
              ).customBottomSheet(context)
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

          const LabelText(text: MyStrings.selectOtp),
          const SizedBox(height: Dimensions.textToTextSpace),
          FilterRowWidget(
              borderColor: controller.selectedOtp == MyStrings.selectOtp ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
              text: controller.selectedOtp.toTitleCase(),
              press: () {
                FocusScope.of(context).unfocus();
                CustomBottomSheet(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetBar(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [BottomSheetCloseButton()],
                        ),
                        const SizedBox(height: Dimensions.space15),
                        ListView.builder(
                            itemCount: controller.otpTypeList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  final controller= Get.find<CreateVoucherController>();
                                  String selectedValue = controller.otpTypeList[index];
                                  controller.setSelectedOtp(selectedValue);
                                  Navigator.pop(context);

                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child: BottomSheetCard(
                                  child: Text(
                                    controller.otpTypeList[index].toString().toTitleCase(),
                                    style: regularDefault,
                                  ),
                                ),
                              );
                            })
                      ],
                    )
                ).customBottomSheet(context);
              }
          ),
          const SizedBox(height: Dimensions.space30),

          RoundedButton(
            press: (){
              FocusScope.of(context).unfocus();
              controller.checkAndShowPreviewBottomSheet(context);
            },
            text: MyStrings.createVoucher.tr,
          )
        ],
      ),
    );
  }
}

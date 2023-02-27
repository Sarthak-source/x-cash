import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/money_discharge/make_payment/make_payment_controller.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/make_payment_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/text_field_person_validity_widget.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/widget/make_payment_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

class MakePaymentForm extends StatefulWidget {
  const MakePaymentForm({Key? key}) : super(key: key);

  @override
  State<MakePaymentForm> createState() => _MakePaymentFormState();
}

class _MakePaymentFormState extends State<MakePaymentForm> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakePaymentController>(
      builder: (controller) => Form(
        child: controller.isLoading ? const CustomLoader() : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Focus(
              onFocusChange: (hasFocus){
                if(!hasFocus){
                  controller.checkMerchantFocus(hasFocus);
                }
              },
              child: CustomTextField(
                needOutlineBorder: true,
                labelText: MyStrings.merchantUsernameEmail.tr,
                hintText: MyStrings.merchantUsernameEmailHint.tr,
                onChanged: (value){},
                controller: controller.merchantController,
              ),
            ),
            const SizedBox(height: Dimensions.space5),
            TextFieldPersonValidityWidget(
              isVisible: controller.isAgentFound,
              validMsg: controller.validMerchant,
              invalidMsg: controller.invalidMerchant
            ),
            const SizedBox(height: Dimensions.space15),

            const LabelText(text: MyStrings.selectWallet),
            const SizedBox(height: Dimensions.textToTextSpace),
            SizedBox(
              height: 50,
              child: FilterRowWidget(
                  borderColor: controller.walletsMethod?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                  text: "${controller.walletsMethod?.id.toString() == "-1" ? MyStrings.selectWallet : controller.walletsMethod?.currencyCode}",
                  press: () => CustomBottomSheet(
                      child: Column(
                        children: [
                          const BottomSheetBar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [BottomSheetCloseButton()],
                          ),
                          const SizedBox(height: Dimensions.space15),
                          ListView.builder(
                              itemCount: controller.walletList.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    final controller= Get.find<MakePaymentController>();
                                    Wallets selectedValue = controller.walletList[index];
                                    controller.setWalletMethod(selectedValue);
                                    Navigator.pop(context);

                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                        border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                    ),
                                    child: Text(
                                      controller.walletList[index].currencyCode.toString() ?? "",
                                      style: regularDefault,
                                    ),
                                  ),
                                );
                              }
                          )
                        ],
                      )
                  ).customBottomSheet(context)
              ),
            ),
            const SizedBox(height: Dimensions.space15),

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
            const SizedBox(height: Dimensions.space15),

            const LabelText(text: MyStrings.selectOtp),
            const SizedBox(height: Dimensions.textToTextSpace),
            SizedBox(
              height: 50,
              child: FilterRowWidget(
                  borderColor: controller.selectedOtp == MyStrings.selectOtp ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                  text: controller.selectedOtp.toTitleCase(),
                  press: () => CustomBottomSheet(
                          child: Column(
                            children: [
                             const BottomSheetBar(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  BottomSheetCloseButton()
                                ],
                              ),
                              const SizedBox(height: Dimensions.space15),
                              ListView.builder(
                                  itemCount: controller.otpTypeList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        final controller= Get.find<MakePaymentController>();
                                        String selectedValue = controller.otpTypeList[index];
                                        controller.setOtpMethod(selectedValue);
                                        Navigator.pop(context);

                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                            border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                        ),
                                        child: Text(
                                          controller.otpTypeList[index].toString().toTitleCase() ?? "",
                                          style: regularDefault,
                                        ),
                                      ),
                                    );
                                  }
                              )
                            ],
                          )
                      ).customBottomSheet(context)
              ),
            ),
            const SizedBox(height: Dimensions.space20),

            RoundedButton(
              press: () => controller.checkValidation(context),
              text: MyStrings.makePayment,
            )
          ],
        ),
      )
    );
  }
}

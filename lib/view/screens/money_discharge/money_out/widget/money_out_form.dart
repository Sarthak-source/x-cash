import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
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
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/text_field_person_validity_widget.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/widget/money_out_bottom_sheet.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/widget/money_out_otp_bottom_sheet.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/widget/money_out_wallet_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

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
            Focus(
              onFocusChange: (hasFocus){
                if(!hasFocus){
                  controller.checkAgentFocus(hasFocus);
                }
              },
              child: CustomTextField(
                needOutlineBorder: true,
                labelText: MyStrings.agentUsernameEmail.tr,
                hintText: MyStrings.agentUsernameHint.tr,
                onChanged: (value){},
                controller: controller.agentController,
              ),
            ),
            const SizedBox(height: Dimensions.space5),
            TextFieldPersonValidityWidget(
                isVisible: controller.isAgentFound,
                validMsg: controller.validAgent,
                invalidMsg: controller.invalidAgent
            ),
            const SizedBox(height: Dimensions.space15),

            const LabelText(text: MyStrings.selectWallet),
            const SizedBox(height: Dimensions.textToTextSpace),
            FilterRowWidget(
                borderColor: controller.selectedWallet?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                text: "${controller.selectedWallet?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedWallet?.currencyCode}",
                press: () => moneyOutWalletBottomSheet(controller.walletList, context: context)
            ),
            const SizedBox(height: Dimensions.space15),

            CustomAmountTextField(
              labelText: MyStrings.amount.tr,
              hintText: MyStrings.amountHint.tr,
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
            const SizedBox(height: Dimensions.space5),
            Text(
                "${MyStrings.limit}: ${controller.minLimit} - ${controller.maxLimit} ${controller.currency}",
                style: regularExtraSmall.copyWith(color: MyColor.primaryColor)
            ),
            const SizedBox(height: Dimensions.space15),

            const LabelText(text: MyStrings.selectOtp),
            const SizedBox(height: Dimensions.textToTextSpace),
            FilterRowWidget(
                borderColor: controller.selectedOtp == MyStrings.selectOtp ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                text: controller.selectedOtp.toTitleCase(),
                press: () => moneyOutOtpBottomSheet(controller.otpTypeList, context: context)
            ),
            const SizedBox(height: Dimensions.space20),
            RoundedButton(
              press: (){
                if(controller.agentController.text.toString().isEmpty){
                  CustomSnackBar.error(errorList: [MyStrings.fieldErrorMsg.tr]);
                }
                else{
                  CustomBottomSheet(
                    child: const MoneyOutBottomSheet()
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

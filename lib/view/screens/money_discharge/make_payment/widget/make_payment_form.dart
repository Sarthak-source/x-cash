import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/money_discharge/make_payment/make_payment_controller.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/make_payment_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/widget/make_payment_bottom_sheet.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/widget/make_payment_otp_bottom_sheet.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/widget/make_payment_wallet_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

class MakePaymentForm extends StatefulWidget {
  const MakePaymentForm({Key? key}) : super(key: key);

  @override
  State<MakePaymentForm> createState() => _MakePaymentFormState();
}

class _MakePaymentFormState extends State<MakePaymentForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakePaymentController>(
      builder: (controller) => Form(
        key: formKey,
        child: controller.isLoading ? const CustomLoader() : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              needOutlineBorder: true,
              labelText: MyStrings.merchantUsernameEmail.tr,
              hintText: MyStrings.merchantUsernameEmailHint.tr,
              onChanged: (value){},
              controller: controller.merchantController,
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
            const SizedBox(height: Dimensions.textToTextSpace),
            SizedBox(
              height: 50,
              child: FilterRowWidget(
                  borderColor: controller.walletsMethod?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                  text: "${controller.walletsMethod?.id.toString() == "-1" ? MyStrings.selectWallet : controller.walletsMethod?.currencyCode}",
                  press: () {
                    showMakePaymentWalletBottomSheet(controller.walletList, context: context);
                  }
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
                  press: () {
                    showMakePaymentOTPBottomSheet(controller.otpTypeList, context: context);
                  }
              ),
            ),
            const SizedBox(height: Dimensions.space20),

            RoundedButton(
              press: (){
                if(formKey.currentState!.validate()){
                  CustomBottomSheet(
                    child: const MakePaymentBottomSheet()
                  ).customBottomSheet(context);
                }
              },
              text: MyStrings.makePayment,
            )
          ],
        ),
      )
    );
  }
}

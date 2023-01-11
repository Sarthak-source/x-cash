import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/money_discharge/make_payment/make_payment_controller.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/make_payment_response_model.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';

import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';

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
                labelText: MyStrings.merchantUsernameEmail,
                hintText: MyStrings.merchantUsernameEmailHint,
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),
            const LabelText(text: MyStrings.selectWallet),
            const SizedBox(height: 8),
            /*Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
              decoration: BoxDecoration(
                  color: MyColor.transparentColor,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  border: Border.all(color: MyColor.primaryColor, width: 0.5)
              ),
              child: DropdownButton<Wallets>(
                dropdownColor: MyColor.colorWhite,
                value: controller.walletsType,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (Wallets? newValue) {
                  controller.setWalletsType(newValue);
                },
                items: controller.walletsList.map((Wallets wallet) {
                  return DropdownMenuItem<Wallets>(
                    value: wallet,
                    child: Text(wallet.currencyCode.toString(), style: regularDefault),
                  );
                }).toList(),
              ),
            ),*/
            const SizedBox(height: Dimensions.space15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAmountTextField(
                  labelText: MyStrings.amount,
                  hintText: MyStrings.amountHint,
                  onChanged: (value){},
                  currency: controller.currency,
                ),
                const SizedBox(height: Dimensions.space5),
                Text(MyStrings.min_max_Amount, style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
              ],
            ),
            const SizedBox(height: Dimensions.space15),
            const LabelText(text: MyStrings.selectOtp),
            const SizedBox(height: 8),
            /*Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
              decoration: BoxDecoration(
                  color: MyColor.transparentColor,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                  border: Border.all(color: MyColor.primaryColor, width: 0.5)
              ),
              child: DropdownButton(
                dropdownColor: MyColor.colorWhite,
                value: controller.selectedValue,
                elevation: 8,
                icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                iconDisabledColor: Colors.red,
                iconEnabledColor : MyColor.primaryColor,
                isExpanded: true,
                underline: Container(height: 0, color: MyColor.primaryColor),
                onChanged: (newValue) {},
                items: controller.otpType.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.toString(), style: regularDefault),
                  );
                }).toList(),
              ),
            ),*/
            const SizedBox(height: Dimensions.space20),
            /*controller.isSubmitLoading ? const RoundedLoadingBtn() : RoundedButton(
              press: (){},
              text: MyStrings.makePayment,
            )*/
          ],
        ),
      )
    );
  }
}

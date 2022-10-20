import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';

class AddMoneyForm extends StatefulWidget {
  const AddMoneyForm({Key? key}) : super(key: key);

  @override
  State<AddMoneyForm> createState() => _AddMoneyFormState();
}

class _AddMoneyFormState extends State<AddMoneyForm> {

  var selectWalletValue = "Select Wallet";
  var selectGatewayValue = "Select Gateway";
  var selectOtp = "Select OTP Type";

  List<String> walletItems = ["Select Wallet", "TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR"];
  List<String> gatewayItems = ["Select Gateway", "Paypal - USD", "Stripe Hosted - USD", "PayTM - USD"];
  List<String> otpItems = ["Select OTP Type", "Email", "Sms"];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomDropDownTextField(
              labelText: MyStrings.selectWallet,
              hintText: selectWalletValue,
              selectedValue: selectWalletValue,
              onChanged: (value){
                setState(() {
                  selectWalletValue = value.toString();
                });
              },
              items: walletItems.map((String val){
                return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: interRegularSmall,
                    )
                );
              }).toList()
          ),
          const SizedBox(height: Dimensions.space15),

          CustomDropDownTextField(
              labelText: MyStrings.selectGateway,
              hintText: selectGatewayValue,
              selectedValue: selectGatewayValue,
              onChanged: (value){
                setState(() {
                  selectGatewayValue = value.toString();
                });
              },
              items: gatewayItems.map((String val){
                return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                      style: interRegularSmall,
                    )
                );
              }).toList()
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
              const SizedBox(height: Dimensions.space5),
              Text("Limit: 1.00000000 ~ 100.0000000 USD", style: interRegularExtraSmall.copyWith(color: MyColor.primaryColor))
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

          const SizedBox(height: Dimensions.space20),

          CustomAnimatedButton(
              onTap: (){},
              height: 45,
              width: MediaQuery.of(context).size.width,
              backgroundColor: MyColor.primaryColor,
              child: Text(MyStrings.proceed, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}

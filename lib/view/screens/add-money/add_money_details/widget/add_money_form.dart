import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
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
                      style: regularSmall,
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
                      style: regularSmall,
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
                  onChanged: (value){}, 
                  currency: '',
              ),
              const SizedBox(height: Dimensions.space5),
              Text("Limit: 1.00000000 ~ 100.0000000 USD", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
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
                      style: regularSmall,
                    )
                );
              }).toList()
          ),
          const SizedBox(height: Dimensions.space20),
          RoundedButton(
              press: (){},
              text: MyStrings.proceed,
          )
        ],
      ),
    );
  }
}

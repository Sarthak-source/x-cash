import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';

class CreateVoucherForm extends StatefulWidget {
  const CreateVoucherForm({Key? key}) : super(key: key);

  @override
  State<CreateVoucherForm> createState() => _CreateVoucherFormState();
}

class _CreateVoucherFormState extends State<CreateVoucherForm> {

  var selectWalletValue = "Select Wallet";
  var selectOtp = "Select OTP Type";

  List<String> walletItems = ["Select Wallet", "TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR"];
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAmountTextField(
                  labelText: MyStrings.amount,
                  hintText: MyStrings.amountHint,
                  onChanged: (value){}
              ),
              const SizedBox(height: Dimensions.space5),
              Text(MyStrings.min_max_Amount, style: interRegularExtraSmall.copyWith(color: MyColor.primaryColor))
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
            child: Text(MyStrings.createVoucher, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';

import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

class RequestMoneyForm extends StatefulWidget {
  const RequestMoneyForm({Key? key}) : super(key: key);

  @override
  State<RequestMoneyForm> createState() => _RequestMoneyFormState();
}

class _RequestMoneyFormState extends State<RequestMoneyForm> {

  var selectWalletValue = "Select Wallet";

  List<String> walletItems = ["Select Wallet", "TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR"];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: Dimensions.space5),
              Text("Total Charge: 0.00", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
            ],
          ),
          const SizedBox(height: Dimensions.space15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAmountTextField(
                  labelText: MyStrings.amountToRequest,
                  hintText: MyStrings.amountHint,
                  onChanged: (value){},
                  currency: '',
              ),
              const SizedBox(height: Dimensions.space5),
              Text("Limit: 1.00000000 ~ 100.0000000 USD", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
            ],
          ),

          const SizedBox(height: Dimensions.space15),

          CustomTextField(
              labelText: MyStrings.requestTo,
              hintText: "Enter username / email",
              onChanged: (value){}
          ),

          const SizedBox(height: Dimensions.space15),

          CustomTextField(
              labelText: MyStrings.noteForRecipient,
              hintText: "Type note",
              onChanged: (value){},
          ),

          const SizedBox(height: Dimensions.space25),

          RoundedButton(
            press: (){},
            text: MyStrings.requestNow,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';

import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';

class WithdrawMoneyForm extends StatefulWidget {
  const WithdrawMoneyForm({Key? key}) : super(key: key);

  @override
  State<WithdrawMoneyForm> createState() => _WithdrawMoneyFormState();
}

class _WithdrawMoneyFormState extends State<WithdrawMoneyForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAmountTextField(
              labelText: MyStrings.amount,
              hintText: MyStrings.amountHint,
              onChanged: (value){},
              currency: '',
          ),

          const SizedBox(height: Dimensions.space25),

          RoundedButton(
              press: (){},
              text: MyStrings.submit,
          )
        ],
      ),
    );
  }
}

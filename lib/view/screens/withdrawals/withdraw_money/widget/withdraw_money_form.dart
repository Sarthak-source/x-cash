import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
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
              onChanged: (value){}
          ),

          const SizedBox(height: Dimensions.space25),

          CustomAnimatedButton(
              onTap: (){},
              height: 45,
              width: MediaQuery.of(context).size.width,
              backgroundColor: MyColor.primaryColor,
              child: Text(MyStrings.submit, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}

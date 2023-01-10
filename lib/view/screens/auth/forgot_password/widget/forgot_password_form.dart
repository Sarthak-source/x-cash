import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
              labelText: MyStrings.newPassword,
              hintText: MyStrings.newPasswordHint,
              onChanged: (value){},
              isPassword: true,
              isShowSuffixIcon: true,
          ),
          const SizedBox(height: Dimensions.space25),
          CustomTextField(
            labelText: MyStrings.confirmPassword,
            hintText: MyStrings.confirmPasswordHint,
            onChanged: (value){},
            isPassword: true,
            isShowSuffixIcon: true,
          ),
          const SizedBox(height: Dimensions.space30),
          RoundedButton(
              press: (){},
              color: MyColor.getPrimaryButtonColor(),
              text: MyStrings.resetPassword,
              textColor: MyColor.getPrimaryButtonTextColor(),
          )
        ],
      ),
    );
  }
}

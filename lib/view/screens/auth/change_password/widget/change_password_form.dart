import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/small_text.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            labelText: MyStrings.currentPassword,
            hintText: MyStrings.currentPasswordHint,
            onChanged: (value){},
            isPassword: true,
            isShowSuffixIcon: true,
          ),
          const SizedBox(height: Dimensions.space25),
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
            text: MyStrings.saveNewPassword,
          )
        ],
      ),
    );
  }
}

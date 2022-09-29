import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/components/text/small_text.dart';

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
          CustomTextFormField(
              labelText: MyStrings.newPassword,
              hintText: MyStrings.newPasswordHint,
              fillColor: MyColor.primaryColor100,
              onChanged: (value){},
              isPassword: true,
              isShowSuffixIcon: true,
              isShowBorder: true,
          ),

          const SizedBox(height: Dimensions.space25),

          CustomTextFormField(
            labelText: MyStrings.confirmPassword,
            hintText: MyStrings.confirmPasswordHint,
            fillColor: MyColor.primaryColor100,
            onChanged: (value){},
            isPassword: true,
            isShowBorder: true,
            isShowSuffixIcon: true,
          ),

          const SizedBox(height: Dimensions.space30),
          
          CustomAnimatedButton(
              onTap: (){}, 
              height: Dimensions.defaultButtonH, 
              width: MediaQuery.of(context).size.width, 
              backgroundColor: MyColor.primaryColor,
              child: const SmallText(text: MyStrings.resetPassword, textColor: MyColor.colorWhite, fontSize: Dimensions.fontDefault),
          )
        ],
      ),
    );
  }
}

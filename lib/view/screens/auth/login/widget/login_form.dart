import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/Sizedbox/form_sized_box.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/login/widget/login_bottom_section.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
              labelText: MyStrings.username,
              textInputType: TextInputType.name,
              hintText: MyStrings.usernameHint,
              onChanged: (value){}
          ),
          const FormSizedBox(),
          CustomTextField(
            labelText: MyStrings.password,
            isPassword: true,
            hintText: MyStrings.passwordHint,
            onChanged: (value){},
            isShowSuffixIcon: true,
          ),
          const FormSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 23,
                    height: 25,
                    child: Checkbox(
                      checkColor: MyColor.colorWhite,
                      fillColor: MaterialStateProperty.all(MyColor.primaryColor),
                      activeColor: MyColor.primaryColor,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: Dimensions.space15),
                  const SmallText(text: MyStrings.rememberMe)
                ],
              ),
              TextButton(
                onPressed: (){
                  Get.toNamed(RouteHelper.forgotPasswordScreen);
                },
                child: const SmallText(text: MyStrings.forgotPassword)
              ),
            ],
          ),
          const FormSizedBox(),
          RoundedButton(
              press: () {
                Get.offAndToNamed(RouteHelper.bottomNavBar);
              },
              color: MyColor.getPrimaryButtonColor(),
              text: MyStrings.signIn,
              textColor: MyColor.getPrimaryButtonTextColor()
          ),
          const SizedBox(height: Dimensions.space40),
          const LoginBottomSection()
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/Sizedbox/form_sized_box.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/login/widget/login_bottom_section.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isChecked = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomTextFormField(

              labelText: MyStrings.username,
              isShowBorder: true,
              inputType: TextInputType.name,
              hintText: MyStrings.usernameHint,
              onChanged: (value){}
          ),

          const FormSizedBox(),

          CustomTextFormField(

            labelText: MyStrings.password,
            isPassword: true,
            isShowBorder: true,
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

                  const SmallText(text: MyStrings.rememberMe, fontSize: Dimensions.fontDefault)
                ],
              ),

              TextButton(
                onPressed: (){
                  Get.toNamed(RouteHelper.forgotPasswordScreen);
                },
                child: const SmallText(text: "${MyStrings.forgotPassword} ?", fontSize: Dimensions.fontDefault)
              ),
            ],
          ),

          const FormSizedBox(),

          CustomAnimatedButton(

              onTap: () async{

                setState(() {

                  loading = true;
                });
                await Future.delayed(const Duration(seconds: 3));
                //Get.offAllNamed(RouteHelper.bottomNav);

              },
              height: Dimensions.defaultButtonH,
              width: MediaQuery.of(context).size.width,
              backgroundColor: MyColor.primaryColor,
              child: loading ? const SizedBox(

                height: 15, width: 15,
                child: CircularProgressIndicator(color: MyColor.colorWhite, strokeWidth: 1.5),
              ) : const SmallText(text: MyStrings.signIn, fontSize: Dimensions.fontDefault, textColor: MyColor.colorWhite)
          ),

          const SizedBox(height: Dimensions.space40),

          const LoginBottomSection()
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/Sizedbox/form_sized_box.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';

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
                  const SizedBox(width: 12),
                  Text(
                      "Remember me",
                      style: interRegularSmall
                  )
                ],
              ),

              TextButton(

                onPressed: (){

                  //Get.toNamed(RouteHelper.forgotPasswordScreen);
                },
                child: Text(
                    "Forget Password?",
                    style: interRegularSmall
                ),
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
              ) : Text(

                  MyStrings.signIn,
                  textAlign: TextAlign.center,
                  style: interSemiBoldSmall.copyWith(color: MyColor.colorWhite)
              )
          ),
          const SizedBox(height: 40),
          bottomSection()
        ],
      ),
    );
  }

  bottomSection() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(MyStrings.donotAccount, style: interRegularDefault),
        TextButton(

          onPressed: () {
            //Get.offAllNamed(RouteHelper.registrationScreen);
          },
          child: Text(

            MyStrings.registerNow,
            style: interRegularDefault.copyWith(color: MyColor.primaryColor, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
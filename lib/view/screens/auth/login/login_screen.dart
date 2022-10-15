import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/view/components/text/header_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/login/widget/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.colorWhite,

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingV, horizontal: Dimensions.defaultPaddingH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HeaderText(text: MyStrings.welcomeBack),

                  SizedBox(height: 10),

                  SmallText(text: MyStrings.loginSubTitle, textColor: MyColor.primarySubTextColor, fontSize: Dimensions.fontDefault),

                  SizedBox(height: Dimensions.space40),

                  LoginForm()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/core/utils/util.dart';
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
    MyUtil.secondaryTheme();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.colorWhite,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.welcomeBack, textAlign: TextAlign.left, style: interRegularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Text(MyStrings.loginSubTitle, textAlign: TextAlign.left, style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),

                const SizedBox(height: 40),

                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

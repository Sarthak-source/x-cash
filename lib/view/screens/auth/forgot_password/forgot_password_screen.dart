import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/text/app_bar_title.dart';
import 'package:xcash_app/view/components/text/header_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/forgot_password/widget/forgot_password_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  void initState() {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: MyColor.colorWhite,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: MyColor.primaryColor100,
            systemNavigationBarIconBrightness: Brightness.dark
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: AppBar(
          backgroundColor: MyColor.colorWhite,
          elevation: 0,
          title: const AppBarTitle(text: MyStrings.forgotPassword),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: MyColor.primaryColor, size: 20),
          ),
        ),
        
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingV, horizontal: Dimensions.defaultPaddingH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HeaderText(text: MyStrings.resetPassword),
                  
                  SizedBox(height: Dimensions.space5),
                  
                  SmallText(text: MyStrings.subText, textColor: MyColor.primarySubTextColor, fontSize: Dimensions.fontDefault),

                  SizedBox(height: Dimensions.space45),

                  ForgotPasswordForm()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

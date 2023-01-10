import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/text/app_bar_title.dart';
import 'package:xcash_app/view/components/text/header_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/change_password/widget/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: AppBar(
          backgroundColor: MyColor.colorWhite,
          elevation: 0,
          title: const AppBarTitle(text: MyStrings.changePassword),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: MyColor.primaryColor, size: 20),
          ),
        ),

        body: SingleChildScrollView(
            child: Padding(
              padding: Dimensions.defaultPaddingHV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(text: MyStrings.changePassword),
                  const SizedBox(height: Dimensions.space5),
                  SmallText(text: MyStrings.subText, textStyle: regularSmall.copyWith(color: MyColor.getContentTextColor())),
                  const SizedBox(height: Dimensions.space45),
                  const ChangePasswordForm()
                ],
              ),
            ),
          ),
        ),
    );
  }
}

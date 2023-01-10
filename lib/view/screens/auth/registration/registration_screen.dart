import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/view/components/text/header_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/SelectRegistrationAccount.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.colorWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: Dimensions.defaultPaddingHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.space30),
                const HeaderText(text: MyStrings.createAnAccount),
                const SizedBox(height: Dimensions.space10),
                SmallText(text: MyStrings.registerSubTitle, textStyle: regularSmall.copyWith(color: MyColor.getContentTextColor())),
                const SizedBox(height: Dimensions.space45),
                const SelectRegistrationAccount()
              ],
            ),
          ),
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
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
                HeaderText(text: MyStrings.createAnAccount),

                SizedBox(height: Dimensions.space10),

                SmallText(text: "Create your account, it takes less than a \nminute enter your details"),

                SizedBox(height: Dimensions.space45),

                SelectRegistrationAccount()
              ],
            ),
          ),
        )
      ),
    );
  }
}

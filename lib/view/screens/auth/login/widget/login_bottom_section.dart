import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class LoginBottomSection extends StatefulWidget {
  const LoginBottomSection({Key? key}) : super(key: key);

  @override
  State<LoginBottomSection> createState() => _LoginBottomSectionState();
}

class _LoginBottomSectionState extends State<LoginBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(MyStrings.donotAccount, style: interRegularDefault),
        TextButton(

          onPressed: () {
            Get.offAllNamed(RouteHelper.registrationScreen);
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

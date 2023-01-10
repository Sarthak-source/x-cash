import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(MyStrings.alreadyAccount, style: regularDefault),
        TextButton(
          onPressed: () {
            Get.toNamed(RouteHelper.loginScreen);
          },
          child: Text(
            MyStrings.signInNow,
            style: regularDefault.copyWith(color: MyColor.primaryColor, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/default_app_text/app_default_text.dart';

class AppBarText extends StatelessWidget {
  final String text;
  final Color textColor;
  const AppBarText({
    Key? key,
    required this.text,
    this.textColor = MyColor.primaryTextColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDefaultText(
      child: Text(
        text,
        style: interRegularDefaultLarge.copyWith(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}

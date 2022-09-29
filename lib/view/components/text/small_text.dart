import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  const SmallText({Key? key, required this.text, this.textColor = MyColor.primaryTextColor, this.fontSize = Dimensions.fontSmall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: interRegularSmall.copyWith(color: textColor, fontWeight: FontWeight.w400, fontSize: fontSize),
    );
  }
}
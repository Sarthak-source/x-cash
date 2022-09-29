import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const SmallText({
    Key? key,
    required this.text,
    this.textColor = MyColor.primaryTextColor,
    this.fontSize = Dimensions.fontSmall,
    this.fontWeight = FontWeight.w400
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: interRegularSmall.copyWith(color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class NotificationCountText extends StatelessWidget {
  final String text;
  final Color textColor;
  final TextAlign textAlign;
  const NotificationCountText({
    Key? key,
    required this.text,
    this.textColor = MyColor.colorWhite,
    this.textAlign = TextAlign.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: interOverSmall.copyWith(color: textColor, fontWeight: FontWeight.w500),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final Color textColor;
  const AppBarTitle({
    Key? key,
    required this.text,
    this.textColor = MyColor.primaryTextColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: interRegularDefaultLarge.copyWith(color: textColor, fontWeight: FontWeight.w500),
    );
  }
}

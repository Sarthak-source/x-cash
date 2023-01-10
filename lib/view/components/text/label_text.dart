import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class LabelText extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;

  const LabelText({
    Key? key,
    required this.text,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: regularDefault.copyWith(color: MyColor.getLabelTextColor()),
    );
  }
}

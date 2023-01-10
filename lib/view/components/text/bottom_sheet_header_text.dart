import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/style.dart';

class BottomSheetHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const BottomSheetHeaderText({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: regularLarge.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

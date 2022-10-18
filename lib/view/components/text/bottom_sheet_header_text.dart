import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/styles.dart';

class BottomSheetHeaderText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const BottomSheetHeaderText({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

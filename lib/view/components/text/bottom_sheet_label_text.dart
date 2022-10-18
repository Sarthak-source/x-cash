import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class BottomSheetLabelText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const BottomSheetLabelText({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor, fontWeight: FontWeight.w500)
    );
  }
}

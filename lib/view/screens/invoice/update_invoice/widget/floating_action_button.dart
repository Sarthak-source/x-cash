import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class FabButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color? textColor, bgColor;
  const FabButton({
    Key? key,
    required this.text,
    this.textColor = MyColor.colorWhite,
    this.bgColor = MyColor.colorBlack,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
      child: Text(
        text, textAlign: TextAlign.center, style: regularSmall.copyWith(color: textColor),
      ),
    );
  }
}

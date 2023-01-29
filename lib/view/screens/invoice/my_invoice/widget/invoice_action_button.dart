import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class InVoiceActionButton extends StatelessWidget {

  final IconData iconData;
  final String text;
  final VoidCallback press;
  final Color bgColor;

  const InVoiceActionButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.press,
    required this.bgColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, color: MyColor.colorWhite, size: 20),
            const SizedBox(width: Dimensions.space10),
            Text(
              text,
              style: regularDefault.copyWith(color: MyColor.colorWhite),
            )
          ],
        ),
      ),
    );
  }
}

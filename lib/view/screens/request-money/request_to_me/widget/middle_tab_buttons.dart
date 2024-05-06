import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class MiddleTabButtons extends StatelessWidget {

  final String buttonName;
  final bool activeButton;
  final VoidCallback press;

  const MiddleTabButtons({
    Key? key,
    required this.buttonName,
    required this.activeButton,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: press,
            child: Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: activeButton ? MyColor.primaryColor : MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text(buttonName.tr, textAlign: TextAlign.center, style: regularSmall.copyWith(color: activeButton ? MyColor.colorWhite : MyColor.primaryColor)),
            )
        ),
      );
  }
}

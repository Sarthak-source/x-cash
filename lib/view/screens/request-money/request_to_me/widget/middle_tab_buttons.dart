import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/data/controller/voucher/voucher_list_controller.dart';

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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10),
              decoration: BoxDecoration(
                  color: activeButton ? MyColor.primaryColor : MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(buttonName, textAlign: TextAlign.center, style: regularSmall.copyWith(color: activeButton ? MyColor.colorWhite : MyColor.primaryColor)),
            )
        ),
      );
  }
}

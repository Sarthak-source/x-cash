import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class TextFieldPersonValidityWidget extends StatelessWidget {

  final bool? isVisible;
  final String validMsg;
  final String invalidMsg;

  const TextFieldPersonValidityWidget({
    Key? key,
    this.isVisible,
    required this.validMsg,
    required this.invalidMsg
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible != null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isVisible == true ? Text(
            validMsg.tr,
            style: regularSmall.copyWith(color: MyColor.colorGreen, fontWeight: FontWeight.w500),
          ) : Text(
            invalidMsg.tr,
            style: regularSmall.copyWith(color: MyColor.colorRed, fontWeight: FontWeight.w500),
          ),
        ],
      )
    );
  }
}

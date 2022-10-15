import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CustomBottomSheet{

  final Widget child;
  bool isNeedMargin;
  CustomBottomSheet({required this.child, this.isNeedMargin = false});

  void customBottomSheet(BuildContext context){

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: MyColor.transparentColor,
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          margin: isNeedMargin ? const EdgeInsets.only(left: 15, right: 15, bottom: 15) : EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: isNeedMargin ? BorderRadius.circular(15) : const BorderRadius.vertical(top: Radius.circular(15))
          ),
          child: child,
        ),
      )
    );
  }
}
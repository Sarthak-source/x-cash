import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/default_app_text/app_default_text.dart';

class TypeofUser extends StatelessWidget {

  final Color borderColor, backgroundColor;
  final double borderRadius;
  final Widget child;
  final VoidCallback onPressed;

  const TypeofUser({
    Key? key,
    this.backgroundColor = MyColor.colorWhite,
    this.borderColor = MyColor.borderColor,
    this.borderRadius = Dimensions.cardRadius,
    required this.onPressed,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDefaultText(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: 1)
          ),
          child: child,
        ),
      ),
    );
  }
}

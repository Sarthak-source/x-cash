import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class ActionButtonIconWidget extends StatelessWidget {

  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback pressed;
  final double size;
  final double spacing;
  final IconData? icon;
  final bool isImage;
  final String? imageSrc;

  const ActionButtonIconWidget({
    Key? key,
    this.backgroundColor = MyColor.colorWhite,
    this.iconColor = MyColor.primaryColor,
    required this.pressed,
    this.size = 30,
    this.spacing = 15,
    this.icon,
    this.imageSrc,
    this.isImage = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('action widget ${isImage}');
    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: size, width: size,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: spacing),
        decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        child: isImage ? Image.asset(
          imageSrc!,
          color: iconColor,
          height: size / 2,
          width: size / 2
        ) : Icon(
          icon,
          color: iconColor,
          size: size / 2
        ),
      ),
    );
  }
}

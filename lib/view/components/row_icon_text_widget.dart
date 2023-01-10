import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class RowIconTextWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSvgPicture;
  final String image;
  final String text;

  const RowIconTextWidget({
    Key? key,
    this.onPressed,
    this.isSvgPicture = false,
    required this.image,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSvgPicture ? GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          CircleShapeImage(
            isSvgImage: isSvgPicture,
            image: image,
            imageColor: MyColor.primaryTextColor,
            imageSize: 16,
          ),

          const SizedBox(width: Dimensions.space20),

          Text(text, style: regularSmall.copyWith(fontWeight: FontWeight.w500))
        ],
      ),
    ) : GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          CircleShapeImage(
            isSvgImage: isSvgPicture,
            image: image,
            imageColor: MyColor.primaryTextColor,
            imageSize: 16,
          ),

          const SizedBox(width: Dimensions.space20),

          Text(text, style: regularSmall.copyWith(fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

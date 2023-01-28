import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CircleShapeImage extends StatefulWidget {
  final String image;
  final Color backgroundColor, imageColor;
  final double imageSize;
  final bool isSvgImage;
  const CircleShapeImage({
    Key? key,
    this.backgroundColor = MyColor.screenBgColor,
    this.imageColor = MyColor.primaryColor,
    this.imageSize = 20,
    required this.image,
    this.isSvgImage = false
  }) : super(key: key);

  @override
  State<CircleShapeImage> createState() => _CircleShapeImageState();
}

class _CircleShapeImageState extends State<CircleShapeImage> {
  @override
  Widget build(BuildContext context) {
    return widget.isSvgImage ? Container(
      height: 30, width: 30,
      padding: const EdgeInsets.all(Dimensions.space10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        shape: BoxShape.circle
      ),
      child: SvgPicture.asset(widget.image, color: widget.imageColor, height: widget.imageSize, width: widget.imageSize),
    ) : Container(
      height: 30, width: 30,
      padding: const EdgeInsets.all(Dimensions.space10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle
      ),
      child: Image.asset(widget.image, color: widget.imageColor, height: widget.imageSize, width: widget.imageSize),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CustomCard extends StatefulWidget {
  final double paddingLeft, paddingRight, paddingTop, paddingBottom;
  final Color backgroundColor;
  final double radius;
  final VoidCallback? onPressed;
  final Widget child;
  bool isPress;
  CustomCard({
    Key? key,
    this.paddingLeft = Dimensions.space15,
    this.paddingRight = Dimensions.space15,
    this.paddingTop = Dimensions.space10,
    this.paddingBottom = Dimensions.space10,
    this.backgroundColor = MyColor.colorWhite,
    this.radius = Dimensions.cardRadius,
    this.onPressed,
    this.isPress = false,
    required this.child
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return widget.isPress ? GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight, top: widget.paddingTop, bottom: widget.paddingBottom),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius)
        ),
        child: widget.child,
      ),
    ) : Container(
      padding: EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight, top: widget.paddingTop, bottom: widget.paddingBottom),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: widget.child,
    );
  }
}

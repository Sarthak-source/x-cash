import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CustomAnimatedButton extends StatefulWidget {

  final Widget child;
  VoidCallback onTap;
  final double height, width;
  final Color backgroundColor;
  final Color borderColor;

  CustomAnimatedButton({
    Key? key,
    required this.child,
    required this.onTap,
    required this.height,
    required this.width,
    required this.backgroundColor,
    this.borderColor = MyColor.primaryColor,
  }) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> with SingleTickerProviderStateMixin{

  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {

    _controller = AnimationController(

      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _scale = 1 - _controller.value;

    return  Center(

      child: GestureDetector(

        onTap: widget.onTap,
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        child: Transform.scale(

          scale: _scale,
          child: _animatedButton(),
        ),

      ),
    );
  }

  Widget  _animatedButton() {

    return Container(

      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(

        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: widget.borderColor, width: 1.5)
      ),
      child: widget.child
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
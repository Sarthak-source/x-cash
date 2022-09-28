import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {

  final bool isActive;
  final PageController pageController;
  final Color activeColor, inactiveColor;
  final Duration duration;
  final Function? onChanged;

  const CustomDotIndicator({

    Key? key,
    required this.pageController,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.duration,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(


      duration: duration,
      width: isActive ? 10.0 : 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 15.0,
      decoration: BoxDecoration(

          color: isActive ? activeColor : inactiveColor,
          shape: BoxShape.circle
      ),
    );
  }
}
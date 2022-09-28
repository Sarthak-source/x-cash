import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  MyColor.colorWhite,
        body: Stack(
          children: [
            Positioned(
              left: -80,
              child: Transform.rotate(
                angle: math.pi / 6,
                child: Container(
                  height: 300, width: 300,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 80,
                        left: -140,
                        child: Transform.rotate(
                          angle: math.pi * 7.4688,
                          child: Image.asset(MyImages.bg1, height: 400, width: MediaQuery.of(context).size.width, color: MyColor.colorWhite),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 20,
              right: -220,
              child: Transform.rotate(
                angle: math.pi / 6,
                child: Container(
                  height: 300, width: 300,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor100,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

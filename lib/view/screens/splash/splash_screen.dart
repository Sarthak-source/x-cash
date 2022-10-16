import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/util.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    MyUtil.primaryTheme();
    Timer(
        const Duration(seconds: 5),(){
      Get.toNamed(RouteHelper.onboardScreen);
    }
    );
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: Stack(
          children: [

            Positioned(
                top: -50, left: 0, right: 0,
                child: Image.asset(MyImages.bg1)
            ),

            Align(
              alignment: Alignment.center,
              child: Image.asset(MyImages.appLogo),
            ),

            Positioned(
                bottom: -50, left: 0, right: 0,
                child: Image.asset(MyImages.bg1)
            ),
          ],
        ),
      ),
    );
  }
}

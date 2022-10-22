import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'dart:math' as math;

import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.colorWhite,
        body: Stack(
          children: [

            Positioned(
              top: -20,
              left: -150,
              child: Transform.rotate(
                angle: math.pi / 6,
                child: Container(
                  height: 370, width: 370,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(40),
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
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: buildPage(MyImages.otp, "OTP Verify", "Enter the otp sent to ", "demo123@gmail.com"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String imagePath, String title, String subTitle, String email) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: 250,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 40, left: 50, right: 50),
          decoration: const BoxDecoration(
              color: MyColor.colorWhite,
              shape: BoxShape.circle
          ),
          child: Container(
            height: 240, width: 240,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: MyColor.primaryColor100,
                shape: BoxShape.circle,
                image: DecorationImage(
                    scale: 0.8,
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(imagePath),
                    fit: BoxFit.scaleDown
                )
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(title, textAlign: TextAlign.center,
            style: interRegularHeader.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(subTitle, textAlign: TextAlign.center,
                style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor, fontWeight: FontWeight.w500)
            ),
            Text(email, textAlign: TextAlign.center,
                style: interRegularDefault.copyWith(fontWeight: FontWeight.w600)
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'dart:math' as math;
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/indicators/custom_dot_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  final PageController pageController = PageController();
  var selectedIndex = 0;

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }

  @override
  void dispose() {
    MyUtil.primaryTheme();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  MyColor.colorWhite,
        body: Stack(
          children: [

            //
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
                  child: Stack(
                    children: [
                      Positioned(
                        top: -120,
                        left: -100,
                        child: Transform.rotate(
                          angle: - (math.pi * 7.4688),
                          child: Image.asset(MyImages.bg1, height: 400, width: MediaQuery.of(context).size.width, color: MyColor.colorWhite),
                        ),
                      ),
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
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  controller: pageController,
                  children: [
                    buildPage(MyImages.onboard1, MyStrings.onboardTitle1, MyStrings.onboardSubTitle1),
                    buildPage(MyImages.onboard2, MyStrings.onboardTitle2, MyStrings.onboardSubTitle2),
                    buildPage(MyImages.onboard3, MyStrings.onboardTitle3, MyStrings.onboardSubTitle3)
                  ],
                  onPageChanged: (index){
                    selectedIndex = index;
                  }
                ),
              ),
            ),

            Positioned(

              bottom: 130,
              left: 15, right: 15,
              child: dotsIndicator(),
            ),

            Positioned(

              bottom: 20,
              left: 15, right: 15,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  CustomAnimatedButton(

                    onTap: (){
                      //Get.offAllNamed(RouteHelper.loginScreen);
                    },
                    height: 45,
                    width: 80,
                    backgroundColor: MyColor.colorWhite,
                    borderColor: MyColor.lineColor,
                    child: Text(

                        MyStrings.skip,
                        textAlign: TextAlign.center,
                        style: interRegularDefault.copyWith(color: MyColor.primaryTextColor)
                    ),
                  ),

                  CustomAnimatedButton(

                    onTap: (){
                      if(selectedIndex==2){
                        //Get.offAllNamed(RouteHelper.loginScreen);
                      }else{
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut
                        );
                      }
                    },
                    height: 45,
                    width: 120,
                    backgroundColor: MyColor.primaryColor,
                    borderColor: MyColor.primaryColor,
                    child: Text(
                        selectedIndex==2?MyStrings.getStarted:MyStrings.next,
                        textAlign: TextAlign.center,
                        style: interRegularDefault.copyWith(color: MyColor.colorWhite)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPage(String imagePath, String title, String subTitle) {

    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          height: 250, width: 250,
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

        Text(title, textAlign: TextAlign.center, style: interRegularHeader.copyWith(fontWeight: FontWeight.w600),maxLines: 2),
        const SizedBox(height: 15),

        Text(subTitle, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor)),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget dotsIndicator() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ...List.generate(

            3, (index) => GestureDetector(
          onTap:(){
            // controller.changeSelectedPlan(index);
            pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut
            );
          },
          child: CustomDotIndicator(

            pageController: pageController,
            isActive: index == selectedIndex ? true : false,
            activeColor: MyColor.primaryColor,
            inactiveColor: MyColor.primaryColor100,
            duration: const Duration(milliseconds: 500),
            onChanged: (){

              setState(() {

                selectedIndex = index;
              });
            },
          ),
        )
        )
      ],
    );
  }
}

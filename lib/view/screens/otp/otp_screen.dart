import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/repo/opt_repo/opt_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/timer/timer.dart';

import '../../../data/controller/otp_controller/otp_controller.dart';


class OtpScreen extends StatefulWidget {

 final String actionId;
 final String nextRoute;

  const OtpScreen({
    Key? key,
    required this.actionId,
    required this.nextRoute,
  }) : super(key: key);


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(OtpRepo(apiClient: Get.find()));
    final controller = Get.put(OtpController(repo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.nextRoute = widget.nextRoute;
      controller.actionId = widget.actionId;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.getScreenBgColor(),
        appBar: CustomAppBar(
          fromAuth: false,
          title: MyStrings.otpVerify.tr,
          isShowBackBtn: true,
          isShowActionBtn: false,
          bgColor: MyColor.getAppBarColor()
        ),
        body: GetBuilder<OtpController>(
          builder: (controller) => SingleChildScrollView(
              padding: Dimensions.screenPaddingHV,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: Dimensions.space30),
                    Image.asset(MyImages.otpImage, height: 70, width: 70),
                    const SizedBox(height: Dimensions.space30),
                    Text(MyStrings.viaEmailVerify.tr, maxLines: 2, textAlign: TextAlign.center, style: regularDefault.copyWith(color: MyColor.getLabelTextColor(), height: 2)),
                    const SizedBox(height: Dimensions.space30),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: OtpTimer(
                        onTimeComplete: (){}
                      )
                    ),
                    const SizedBox(height: Dimensions.space30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                        length: 6,
                        textStyle: regularLarge.copyWith(color: MyColor.getPrimaryColor()),
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderWidth: 1,
                            borderRadius: BorderRadius.circular(5),
                            inactiveColor:  MyColor.getTextFieldDisableBorder(),
                            inactiveFillColor: MyColor.getScreenBgColor(),
                            activeFillColor: MyColor.getScreenBgColor(),
                            activeColor: MyColor.getPrimaryColor(),
                            selectedFillColor: MyColor.getScreenBgColor(),
                            selectedColor: MyColor.getPrimaryColor()
                        ),
                        cursorColor: MyColor.getTextColor(),
                        animationDuration:
                        const Duration(milliseconds: 100),
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        beforeTextPaste: (text) {
                          return true;
                        },
                        onChanged: (value) {
                          controller.currentText = value;
                        },
                      ),
                    ),
                    const SizedBox(height: Dimensions.space20),
                    controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                      text: MyStrings.verify.tr,
                      press: (){
                        controller.verifyEmail(controller.currentText);
                      },
                    ),
                    const SizedBox(height: Dimensions.space30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(MyStrings.didNotReceiveCode.tr, style: regularDefault.copyWith(color: MyColor.getLabelTextColor())),
                        const SizedBox(width: Dimensions.space10),
                        controller.resendLoading?
                        Container(margin:const EdgeInsets.only(left: 5,top: 5),height:20,width:20,child: CircularProgressIndicator(color: MyColor.getPrimaryColor())):
                        GestureDetector(
                          onTap: (){
                            controller.sendCodeAgain();
                          },
                          child: Text(MyStrings.resend.tr, style: regularDefault.copyWith(color: MyColor.getPrimaryColor(),decoration: TextDecoration.underline)),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        )
      ),
    );
  }
}





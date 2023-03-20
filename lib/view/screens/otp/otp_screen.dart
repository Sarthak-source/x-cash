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
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/otp/widget/otp_timer.dart';

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
        backgroundColor: MyColor.screenBgColor,
        appBar: CustomAppBar(
          fromAuth: false,
          title: MyStrings.otpVerification,
          isShowBackBtn: true,
          isShowActionBtn: false,
          bgColor: MyColor.getAppBarColor()
        ),
        body: GetBuilder<OtpController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(Dimensions.space7),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
                  ),
                  child: Image.asset(MyImages.appLogo, height: 80, width: 200),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: Dimensions.space30, horizontal: Dimensions.space15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(MyStrings.otpVerification.tr, style: regularLarge.copyWith(color: MyColor.colorBlack, fontWeight: FontWeight.w400)),
                      const SizedBox(height: Dimensions.space8),
                      Text(MyStrings.enterYourOTPCode.tr, style: regularMediumLarge.copyWith(color: MyColor.colorBlack, fontWeight: FontWeight.w600)),
                      const SizedBox(height: Dimensions.space10),
                      Text(MyStrings.sixDigitOtpEmailMsg.tr, maxLines: 2, textAlign: TextAlign.center, style: regularLarge.copyWith(color: MyColor.labelTextColor)),
                      const SizedBox(height: Dimensions.space30),
                      LabelText(text: MyStrings.enterOtpCode.tr),
                      const SizedBox(height: Dimensions.textToTextSpace),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                          length: 6,
                          textStyle: regularLarge.copyWith(color: MyColor.getPrimaryColor()),
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              borderWidth: 1,
                              borderRadius: BorderRadius.circular(5),
                              inactiveColor:  MyColor.getTextFieldDisableBorder(),
                              inactiveFillColor: MyColor.transparentColor,
                              activeFillColor: MyColor.transparentColor,
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
                            if(value.length == 6){
                              controller.verifyEmail(value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: Dimensions.space15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.isOtpExpired ? Row(
                            children: [
                              Text(MyStrings.otpHasBeenExpired.tr, style: regularDefault.copyWith(color: MyColor.labelTextColor)),
                              const SizedBox(width: Dimensions.space12),
                              controller.resendLoading? Container(
                                  margin:const EdgeInsets.only(left: 5,top: 5),
                                  height:20,width:20,
                                  child: CircularProgressIndicator(color: MyColor.getPrimaryColor())
                              ) : GestureDetector(
                                onTap: (){
                                  controller.sendCodeAgain();
                                },
                                child: Text(MyStrings.resendCode.tr, style: regularDefault.copyWith(color: MyColor.getPrimaryColor(),decoration: TextDecoration.underline)),
                              )
                            ],
                          ) : OtpTimer(
                            duration: controller.time,
                            onTimeComplete: (){
                                controller.makeOtpExpired(true);
                              }
                          ),
                          GestureDetector(
                            onTap: () => controller.verifyEmail(controller.currentText),
                            child: Container(
                              height: 40, width: 40,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
                              child: controller.submitLoading ? const SizedBox(
                                height: 20, width: 20,
                                child: CircularProgressIndicator(
                                  color: MyColor.colorWhite,
                                  strokeWidth: 2,
                                ),
                              ) : const Icon(Icons.arrow_forward, color: MyColor.colorWhite, size: 20),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}





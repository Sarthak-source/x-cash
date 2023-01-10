import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/auth/two_factor_controller.dart';
import 'package:xcash_app/data/repo/auth/two_factor_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class TwoFactorVerificationScreen extends StatefulWidget {

  final bool isProfileCompleteEnable;
  const TwoFactorVerificationScreen({
    Key? key,
    required this.isProfileCompleteEnable
  }) : super(key: key);

  @override
  State<TwoFactorVerificationScreen> createState() => _TwoFactorVerificationScreenState();
}

class _TwoFactorVerificationScreenState extends State<TwoFactorVerificationScreen> {

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TwoFactorRepo(apiClient: Get.find()));
    final controller = Get.put(TwoFactorController(repo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.isProfileCompleteEnable=widget.isProfileCompleteEnable;
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
        appBar: CustomAppBar(title:MyStrings.twoFactorAuth.tr,fromAuth: true,bgColor: MyColor.transparentColor,),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
          child: GetBuilder<TwoFactorController>(
              builder: (controller) =>  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: Dimensions.space20,),
                    Container(
                      height: 100, width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: MyColor.getCardBgColor(),
                          shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset(MyImages.emailVerifyImage, height: 50, width: 50),
                    ),
                    const SizedBox(height: Dimensions.space50),
                    Text(MyStrings.twoFactorMsg.tr, style: regularDefault.copyWith(color: MyColor.colorWhite), textAlign: TextAlign.center),
                    const SizedBox(height: Dimensions.space30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                        length: 6,
                        textStyle: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                        obscureText: false,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderWidth: 1,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40,
                            fieldWidth: 40,
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
                    const SizedBox(height: Dimensions.space30),
                    controller.submitLoading?const RoundedLoadingBtn():RoundedButton(
                      press: (){
                        controller.verifyYourSms(controller.currentText);
                      },
                      text: MyStrings.verify.tr,
                    ),
                    const SizedBox(height: Dimensions.space30),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}

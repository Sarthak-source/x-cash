import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/auth/auth/email_verification_controler.dart';
import 'package:xcash_app/data/repo/auth/general_setting_repo.dart';
import 'package:xcash_app/data/repo/auth/sms_email_verification_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/will_pop_widget.dart';


class EmailVerificationScreen extends StatefulWidget {

  final bool needSmsVerification;
  final bool isProfileCompleteEnabled;
  final bool needTwoFactor;

  const EmailVerificationScreen({
    Key? key,
    required this.needSmsVerification,
    required this.isProfileCompleteEnabled,
    required this.needTwoFactor
  }) : super(key: key);


  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(SmsEmailVerificationRepo(apiClient: Get.find()));
    Get.put(GeneralSettingRepo(apiClient: Get.find()));
   final controller = Get.put(EmailVerificationController(repo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.needSmsVerification = widget.needSmsVerification;
      controller.isProfileCompleteEnable = widget.isProfileCompleteEnabled;
      controller.needTwoFactor = widget.needTwoFactor;
      controller.loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopWidget(
      nextRoute: RouteHelper.loginScreen,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            fromAuth: true,
            title: MyStrings.emailVerification.tr,
            isShowBackBtn: true,
            isShowActionBtn: false,
            bgColor: MyColor.getAppBarColor()
          ),
          body: GetBuilder<EmailVerificationController>(
            builder: (controller) => controller.isLoading ? Center(
              child: CircularProgressIndicator(color: MyColor.getPrimaryColor())
            ) : SingleChildScrollView(
                padding: Dimensions.defaultPaddingHV,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: Dimensions.space30),
                      Container(
                        height: 100, width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColor.getCardBgColor(),
                            shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset(MyImages.emailVerifyImage, height: 50, width: 50, color: MyColor.getPrimaryColor()),
                      ),
                      const SizedBox(height: Dimensions.space50),
                      Text(MyStrings.viaEmailVerify.tr, maxLines: 2, textAlign: TextAlign.center,style: regularDefault.copyWith(color: MyColor.getLabelTextColor())),
                      const SizedBox(height: 30),

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
                            setState(() {
                              controller.currentText = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: Dimensions.space30),

                      controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                        text: MyStrings.verify.tr,
                        textColor: MyColor.getPrimaryButtonTextColor(),
                        press: (){
                          controller.verifyEmail(controller.currentText);
                        },
                        color: MyColor.getPrimaryButtonColor(),
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
      ),
    );
  }
}





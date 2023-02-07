import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class CustomSnackBar{
  static  error({required List<String>errorList,int duration=5}){
    String message='';
      if(errorList.isEmpty){
        message = MyStrings.somethingWentWrong.tr;
      }else{
        for (var element in errorList) {
          String tempMessage = element.tr;
          message = message.isEmpty?tempMessage:"$message\n$tempMessage";
        }
      }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      progressIndicatorBackgroundColor: MyColor.transparentColor,
      progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(Colors.transparent),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Dimensions.space8),
          Text(message,style: regularLarge.copyWith(color: MyColor.colorWhite)),
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Row(
        children: [
          SvgPicture.asset(MyImages.errorImage, height: 20, width: 20,color: MyColor.colorWhite,),
          const SizedBox(width: Dimensions.space15),
          Text(MyStrings.error.tr.capitalizeFirst??'',style: semiBoldDefault.copyWith(color: MyColor.colorWhite)),
        ],
      ),
      backgroundColor: MyColor.colorRed,
      borderRadius: 4,
      margin: const EdgeInsets.all(Dimensions.space8),
      padding: const EdgeInsets.all(Dimensions.space8),
      duration:  Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeIn,
      showProgressIndicator: true,
      leftBarIndicatorColor: MyColor.transparentColor,
      animationDuration: const Duration(seconds: 1),
      borderColor: MyColor.transparentColor,
      reverseAnimationCurve:Curves.easeOut,
      borderWidth: 2,
    );
  }


  static  success({required List<String>successList,int duration=5}){
    String message='';
    if(successList.isEmpty){
        message = MyStrings.somethingWentWrong.tr;
      }
    else{
      for (var element in successList) {
          String tempMessage = element.tr;
          message = message.isEmpty?tempMessage:"$message\n$tempMessage";
      }
    }
    message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    Get.rawSnackbar(
      progressIndicatorBackgroundColor: MyColor.colorGreen,
      progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(MyColor.transparentColor),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Dimensions.space8),
          Text(message, style: regularLarge.copyWith(color: MyColor.colorWhite)),
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Row(
        children: [
          Image.asset(MyImages.successImage, height: 20, width: 20, color: MyColor.colorWhite,),
          const SizedBox(width: Dimensions.space15),
          Text(MyStrings.success.tr,style: semiBoldDefault.copyWith(color: MyColor.colorWhite)),
        ],
      ),
      backgroundColor: MyColor.colorGreen,
      borderRadius: 4,
      margin: const EdgeInsets.all(Dimensions.space8),
      padding: const EdgeInsets.all(Dimensions.space8),
      duration:  Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
      showProgressIndicator: true,
      leftBarIndicatorColor: MyColor.transparentColor,
      animationDuration: const Duration(seconds: 2),
      borderColor: MyColor.transparentColor,
      reverseAnimationCurve:Curves.easeOut,
      borderWidth: 2,
    );
  }
}
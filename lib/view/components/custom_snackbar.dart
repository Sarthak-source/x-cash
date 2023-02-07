import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class CustomSnackBar{
  static  showCustomSnackBar({required List<String>errorList,required List<String> msg,required bool isError,int duration=5}){
    String message='';
    if(isError){
      if(errorList.isEmpty){
        message = MyStrings.somethingWentWrong.tr;
      }else{
        for (var element in errorList) {
          String tempMessage = element.tr;
          message = message.isEmpty?tempMessage:"$message\n$tempMessage";
        }
      }
      message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    } else{
      if(msg.isEmpty){
        message = MyStrings.requestSuccess.tr;
      }  else{
        for (var element in msg) {
          String tempMessage = element.tr;
          message=message.isEmpty?tempMessage:"$message\n$tempMessage";
        }
      }
      message = Converter.removeQuotationAndSpecialCharacterFromString(message);
    }
    Get.rawSnackbar(
      progressIndicatorBackgroundColor: isError? MyColor.colorRed: MyColor.colorGreen,
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(isError?MyColor.colorRed: MyColor.colorGreen ),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2,),
          Text(message,style: regularDefault.copyWith(color: MyColor.colorBlack)),
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text((!isError? MyStrings.success.tr: MyStrings.error.tr).toLowerCase().capitalizeFirst??'',style: regularLarge.copyWith(color: MyColor.colorBlack)),
          SvgPicture.asset(isError ? MyImages.errorImage : MyImages.errorImage, height: 25,width: 25,color:isError?MyColor.colorRed : MyColor.colorGreen)
        ],
      ),
      backgroundColor: MyColor.getScreenBgColor(),
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      duration:  Duration(seconds: duration),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeIn,
      showProgressIndicator: true,
      leftBarIndicatorColor: MyColor.getScreenBgColor(),
      animationDuration: const Duration(seconds: 1),
      borderColor: MyColor.borderColor,
      reverseAnimationCurve: Curves.easeOut,
      borderWidth: 2,
    );
  }
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
          const SizedBox(height: 2,),
          Text(message,style: regularDefault.copyWith(color: MyColor.colorWhite ),),
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Row(
        children: [
          SvgPicture.asset(MyImages.errorImage, height: 20,width: 20,color: MyColor.colorWhite),
          const SizedBox(width: 5),
          Text(MyStrings.error.tr.capitalizeFirst??'',style: semiBoldSmall.copyWith(fontSize: Dimensions.fontLarge,color: MyColor.colorWhite)),
        ],
      ),
      backgroundColor: MyColor.colorRed,
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
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
    }else{
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
          const SizedBox(height: 2,),
          Text(message,style: regularDefault.copyWith(color: MyColor.colorWhite)),
        ],
      ),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Row(
        children: [
          SvgPicture.asset(MyImages.successImage,height: 20,width: 20,color: MyColor.colorWhite,),
          const SizedBox(width: 5,),
          Text(MyStrings.success.tr,style: semiBoldSmall.copyWith(fontSize: Dimensions.fontLarge, color: MyColor.colorWhite)),
        ],
      ),
      backgroundColor: MyColor.colorGreen,
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
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

  static showSnackBarWithoutTitle(BuildContext context,String message,{Color bg  = MyColor.colorGreen}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bg,
        content: Text(message),
      ),
    );
  }



}
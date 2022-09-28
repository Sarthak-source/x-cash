import 'package:flutter/services.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class MyUtil{

  static primaryTheme(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: MyColor.primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: MyColor.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light));
  }

  static secondaryTheme(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: MyColor.transparentColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: MyColor.colorWhite,
        systemNavigationBarIconBrightness: Brightness.dark));
  }
}
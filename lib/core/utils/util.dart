import 'package:flutter/services.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class MyUtil{

  static primaryTheme(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: MyColor.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: MyColor.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light));
  }
}
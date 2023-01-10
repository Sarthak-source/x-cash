import 'package:flutter/material.dart';

class MyColor{

  static const Color primaryColor = Color(0xff7966FF);
  static const Color secondaryColor = Color(0xffF6F7FE);
  static const Color screenBgColor = Color(0xffF1EFFF);
  static const Color secondaryScreenBgColor = Color(0xffC9C2FF);
  static const Color primaryTextColor = Color(0xff262626);
  static const Color contentTextColor = Color(0xff777777);
  static const Color primaryStatusBarColor = Color(0xff634EF4);
  static const Color underlineTextColor = Color(0xff7966FF);
  static const Color lineColor = Color(0xffECECEC);
  static const Color borderColor = Color(0xffD9D9D9);

  // app bar
  static const Color appBarColor = primaryColor;
  static const Color appBarContentColor = colorWhite;

  // text field
  static const Color labelTextColor = colorBlack;
  static const Color hintTextColor = colorGrey;
  static const Color textFieldDisableBorderColor = Color(0xffCFCEDB);
  static const Color textFieldEnableBorderColor = Color(0xff7966FF);

  // button
  static const Color primaryButtonColor = primaryColor;
  static const Color primaryButtonTextColor = colorWhite;
  static const Color secondaryButtonColor = colorWhite;
  static const Color secondaryButtonTextColor = colorBlack;

  // icon
  static const Color iconColor = Color(0xff555555);
  static const Color filterEnableIconColor = primaryColor;
  static const Color filterIconColor = iconColor;
  static const Color searchEnableIconColor = colorRed;
  static const Color searchIconColor = iconColor;
  static const Color bottomSheetCloseIconColor = colorBlack;

  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorBlack = Color(0xff262626);
  static const Color colorGreen = Color(0xff28C76F);
  static const Color colorGreen100 = Color(0xffD4F4E2);
  static const Color colorOrange = Color(0xffFF9F43);
  static const Color colorOrange100 = Color(0xffFFECD9);
  static const Color colorRed = Color(0xffEA5455);
  static const Color colorRed100 = Color(0xffFCE9E9);
  static const Color colorGrey = Color(0xff555555);
  static const Color transparentColor = Colors.transparent;


  // screen-bg & primary color
  static Color getPrimaryColor(){
    return primaryColor;
  }
  static Color getScreenBgColor(){
    return screenBgColor; 
  }
  static Color getSecondaryScreenBgColor(){
    return secondaryScreenBgColor;
  }

  // appbar color
  static Color getAppBarColor(){
    return appBarColor;
  }
  static Color getAppBarContentColor(){
    return appBarContentColor;
  }

  // text color
  static Color getHeadingTextColor(){
    return primaryTextColor;
  }
  static Color getContentTextColor(){
    return contentTextColor;
  }

  // text-field color
  static Color getLabelTextColor(){
    return labelTextColor;
  }
  static Color getHintTextColor(){
    return hintTextColor;
  }
  static Color getTextFieldDisableBorder(){
    return textFieldDisableBorderColor;
  }
  static Color getTextFieldEnableBorder(){
    return textFieldEnableBorderColor;
  }

  // button color
  static Color getPrimaryButtonColor(){
    return primaryButtonColor;
  }
  static Color getPrimaryButtonTextColor(){
    return primaryButtonTextColor;
  }
  static Color getSecondaryButtonColor(){
    return secondaryButtonColor;
  }
  static Color getSecondaryButtonTextColor(){
    return secondaryButtonTextColor;
  }

  // icon color
  static Color getIconColor(){
    return iconColor;
  }
  static Color getFilterDisableIconColor(){
    return filterIconColor;
  }
  static Color getFilterEnableIconColor(){
    return filterEnableIconColor;
  }
  static Color getSearchIconColor(){
    return searchIconColor;
  }
  static Color getSearchEnableIconColor(){
    return colorRed;
  }

  // transparent color
  static Color getTransparentColor(){
    return transparentColor;
  }

  // text color
  static Color getTextColor(){
    return colorBlack;
  }

  static Color getCardBgColor(){
    return colorWhite;
  }
}
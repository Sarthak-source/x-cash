import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';

class MainItemBottomSheet{

  static void mainItemBottomSheet(BuildContext context){

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: MyColor.getTransparentColor(),
      context: context,
      builder: (context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space15),
          decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BottomSheetHeaderText(text: MyStrings.moreOptions),
                  BottomSheetCloseButton()
                ],
              ),
              const CustomDivider(space: Dimensions.space15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.addMoneyHistory,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuAddMoneyHistory, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.addMoneyHistoryScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.moneyOut,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.moneyOut, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.moneyOutScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.requestToMe,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuRequestToMe, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.requestToMeScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.createVoucher,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.createVoucherScreen);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.space15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.redeemVoucher,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuRedeemLog, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.back();
                        CustomBottomSheet(
                            child: const RedeemVoucher()
                        ).customBottomSheet(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.withdrawMoney,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuWithdraw, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.withdrawMoneyScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.redeemLog,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuRedeemLog, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.redeemLogScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.withdrawMethod,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.menuWithdrawMethod, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.withdrawMethodScreen);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
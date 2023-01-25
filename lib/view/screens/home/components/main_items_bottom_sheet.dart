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
                      height: 40, width: 40,
                      backgroundColor: MyColor.screenBgColor,
                      child: Image.asset(MyImages.moneyHistory, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.addMoneyHistoryScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.moneyOut,
                      height: 40, width: 40,
                      backgroundColor: MyColor.screenBgColor,
                      child: Image.asset(MyImages.moneyOut, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.moneyOutScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.voucher,
                      height: 40, width: 40,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.myVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.toNamed(RouteHelper.myVoucherScreen);
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.redeemVoucher,
                      height: 40, width: 40,
                      backgroundColor: MyColor.screenBgColor,
                      child: Image.asset(MyImages.voucherRedeem, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: (){
                        Get.back();
                        CustomBottomSheet(
                            child: const RedeemVoucher()
                        ).customBottomSheet(context);
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
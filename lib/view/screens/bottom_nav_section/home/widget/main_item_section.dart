import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/components/main_items_bottom_sheet.dart';

class MainItemSection extends StatelessWidget {
  const MainItemSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space10),
      decoration: BoxDecoration(color: MyColor.getCardBgColor()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.addMoney,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.addMoney, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: (){
                    Get.toNamed(RouteHelper.addMoneyScreen);
                  },
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.transfer,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.transfer, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.transferMoneyScreen)
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.makePayment,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.makePayment, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.makePaymentScreen)
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.withdraw,
                  height: 40, width: 40,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.withdraw, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: (){
                    Get.toNamed(RouteHelper.withdrawHistoryScreen);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.space20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.requestMoney,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.requestMoney, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: (){
                    Get.toNamed(RouteHelper.requestMoneyScreen);
                  },
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.transaction,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.transaction, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.transactionHistoryScreen)
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.voucher,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.voucher, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: () => Get.toNamed(RouteHelper.myVoucherScreen),
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.seeMore,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.seeMore, height: 20, width: 20, color: MyColor.primaryColor),
                  onTap: () => MainItemBottomSheet.mainItemBottomSheet(context)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/animated_widget/expanded_widget.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/main_item_history.dart';

class MainItemSection extends StatelessWidget {
  const MainItemSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
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
                      buttonName: MyStrings.moneyOut,
                      backgroundColor: MyColor.screenBgColor,
                      child: Image.asset(MyImages.outMoney, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: () => Get.toNamed(RouteHelper.moneyOutScreen)
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
                    buttonName: MyStrings.exchange,
                    height: 40, width: 40,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.exchange, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: (){
                      Get.toNamed(RouteHelper.exchangeMoneyScreen);
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
                    buttonName: MyStrings.transfer,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.transfer, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: (){
                      Get.toNamed(RouteHelper.transferMoneyScreen);
                    },
                  ),
                ),
                Expanded(
                  child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.requestMoney,
                      backgroundColor: MyColor.screenBgColor,
                      child: SvgPicture.asset(MyImages.requestMoney, color: MyColor.primaryColor, height: 20, width: 20),
                      onTap: () => Get.toNamed(RouteHelper.requestMoneyScreen)
                  ),
                ),
                Expanded(
                  child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.createVoucher,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.createVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.createVoucherScreen),
                  ),
                ),
                Expanded(
                  child: CircleAnimatedButtonWithText(
                      buttonName: MyStrings.withdrawMoney,
                      backgroundColor: MyColor.screenBgColor,
                      child: Image.asset(MyImages.withdrawMoney, height: 20, width: 20, color: MyColor.primaryColor),
                      onTap: () => Get.toNamed(RouteHelper.withdrawMoneyScreen),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Dimensions.space20),
            controller.isVisibleItem ? ExpandedSection(
              expand: controller.isVisibleItem,
              child: const MainItemHistory(),
            ) : const SizedBox(),
            GestureDetector(
              onTap: () => controller.visibleItem(),
              child: Center(
                child: Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: Icon(
                    controller.isVisibleItem ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: controller.isVisibleItem ? MyColor.colorGrey.withOpacity(0.3) : MyColor.primaryColor,
                    size: 20
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';

class MainItemHistory extends StatelessWidget {
  const MainItemHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.space15, bottom: Dimensions.space15, right: Dimensions.space15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(MyStrings.history, style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(width: Dimensions.space10),
              Expanded(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColor.colorGrey.withOpacity(0.2)),
                ),
              )
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.addMoneyHistory,
                backgroundColor: MyColor.screenBgColor,
                child: Image.asset(MyImages.addMoneyHistory, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.toNamed(RouteHelper.addMoneyHistoryScreen);
                },
              ),
            ),
            Expanded(
              child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.voucher,
                  backgroundColor: MyColor.screenBgColor,
                  child: Image.asset(MyImages.voucher, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: () => Get.toNamed(RouteHelper.myVoucherScreen)
              ),
            ),
            Expanded(
              child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.myRequests,
                  backgroundColor: MyColor.screenBgColor,
                  child: Image.asset(MyImages.myRequest, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: () => Get.toNamed(RouteHelper.requestToMeScreen)
              ),
            ),
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.transactions,
                height: 40, width: 40,
                backgroundColor: MyColor.screenBgColor,
                child: Image.asset(MyImages.viewTransaction, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.toNamed(RouteHelper.transactionHistoryScreen);
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
                buttonName: MyStrings.withdrawHistory,
                backgroundColor: MyColor.screenBgColor,
                child: Image.asset(MyImages.withdrawHistory, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.toNamed(RouteHelper.withdrawHistoryScreen);
                },
              ),
            ),
            Expanded(
              child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.invoice,
                  backgroundColor: MyColor.screenBgColor,
                  child: Image.asset(MyImages.invoice, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: () => Get.toNamed(RouteHelper.invoiceScreen)
              ),
            ),
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.redeemVoucher,
                backgroundColor: MyColor.screenBgColor,
                child: Image.asset(MyImages.redeemVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.back();
                  CustomBottomSheet(
                      child: const RedeemVoucher()
                  ).customBottomSheet(context);
                },
              ),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
        const SizedBox(height: Dimensions.space20),
      ],
    );
  }
}

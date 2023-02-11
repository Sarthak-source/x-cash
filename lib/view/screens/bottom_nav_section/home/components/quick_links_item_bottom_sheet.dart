import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class QuickLinkItemBottomSheet{

  static void quickLinkItemBottomSheet(BuildContext context){

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
                        buttonName: MyStrings.moneyOut,
                        height: 40, width: 40,
                        backgroundColor: MyColor.screenBgColor,
                        child: SvgPicture.asset(MyImages.moneyOut, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: (){
                          Get.toNamed(RouteHelper.moneyOutScreen);
                        },
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                          buttonName: MyStrings.makePayment,
                          height: 40, width: 40,
                          backgroundColor: MyColor.screenBgColor,
                          child: SvgPicture.asset(MyImages.menuMakePayment, color: MyColor.primaryColor, height: 20, width: 20),
                          onTap: () => Get.toNamed(RouteHelper.makePaymentScreen)
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                        buttonName: MyStrings.redeemLog,
                        height: 40, width: 40,
                        backgroundColor: MyColor.screenBgColor,
                        child: Image.asset(MyImages.menuRedeemLog, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: (){
                          Get.toNamed(RouteHelper.redeemLogScreen);
                        },
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                        buttonName: MyStrings.invoice,
                        height: 40, width: 40,
                        backgroundColor: MyColor.screenBgColor,
                        child: SvgPicture.asset(MyImages.menuInvoice, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: (){
                          Get.toNamed(RouteHelper.invoiceScreen);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.space10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                        buttonName: MyStrings.addMoney,
                        height: 40, width: 40,
                        backgroundColor: MyColor.screenBgColor,
                        child: SvgPicture.asset(MyImages.menuAddMoney, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: (){
                          Get.toNamed(RouteHelper.addMoneyScreen);
                        },
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                          buttonName: MyStrings.transaction,
                          backgroundColor: MyColor.screenBgColor,
                          child: SvgPicture.asset(MyImages.menuTransaction, color: MyColor.primaryColor, height: 20, width: 20),
                          onTap: () => Get.toNamed(RouteHelper.transactionHistoryScreen)
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                          buttonName: MyStrings.transfer,
                          backgroundColor: MyColor.screenBgColor,
                          child: SvgPicture.asset(MyImages.menuTransfer, color: MyColor.primaryColor, height: 20, width: 20),
                          onTap: () => Get.toNamed(RouteHelper.transferMoneyScreen)
                      ),
                    ),
                    Expanded(
                      child: CircleAnimatedButtonWithText(
                        buttonName: MyStrings.voucher,
                        backgroundColor: MyColor.screenBgColor,
                        child: SvgPicture.asset(MyImages.menuVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: () => Get.toNamed(RouteHelper.myVoucherScreen),
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
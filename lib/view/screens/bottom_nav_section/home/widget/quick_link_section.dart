import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/components/quick_links_item_bottom_sheet.dart';

class QuickLinkSection extends StatelessWidget {
  const QuickLinkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(Dimensions.space15),
      decoration: BoxDecoration(color: MyColor.getCardBgColor()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.quickLink,
            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.exchange,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.exchange, color: MyColor.primaryColor, height: 20, width: 20),
                  onTap: (){
                    Get.toNamed(RouteHelper.exchangeMoneyScreen);
                  },
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.withdrawMoney,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.withdraw, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.withdrawMoneyScreen)
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                    buttonName: MyStrings.createVoucher,
                    backgroundColor: MyColor.screenBgColor,
                    child: SvgPicture.asset(MyImages.createVoucher, color: MyColor.primaryColor, height: 20, width: 20),
                    onTap: () => Get.toNamed(RouteHelper.createVoucherScreen)
                ),
              ),
              Expanded(
                child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.seeMore,
                  backgroundColor: MyColor.screenBgColor,
                  child: SvgPicture.asset(MyImages.seeMore, height: 20, width: 20, color: MyColor.primaryColor),
                  onTap: () => QuickLinkItemBottomSheet.quickLinkItemBottomSheet(context)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

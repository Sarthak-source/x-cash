import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/insight_money_in_sheet_widget.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/insight_money_out_sheet_widget.dart';

class InsightSection extends StatelessWidget {
  const InsightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyStrings.insights.tr,
                  style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                ),
                Text(
                  MyStrings.selectInsight.tr,
                  textAlign: TextAlign.center,
                  style: regularSmall.copyWith(color: MyColor.getPrimaryColor()),
                )
              ],
            ),
            const SizedBox(height: Dimensions.space15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleShapeImage(image: MyImages.inMoney),
                        const SizedBox(width: Dimensions.space8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyStrings.moneyIn.tr, style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.7))),
                            const SizedBox(height: Dimensions.textToTextSpace),
                            Text(controller.totalMoneyIn, style: regularDefault.copyWith(color: MyColor.colorBlack, fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        CustomBottomSheet(
                            isNeedMargin: true,
                            child: const InsightMoneyInSheetWidget()
                        ).customBottomSheet(context);
                      },
                      child: Container(
                        height: 30, width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: MyColor.transparentColor, shape: BoxShape.circle),
                        child: Image.asset(MyImages.dots, color: MyColor.colorBlack, height: 15, width: 15),
                      ),
                    )
                  ],
                ),
                const CustomDivider(space: Dimensions.space15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleShapeImage(image: MyImages.outMoney),
                        const SizedBox(width: Dimensions.space8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MyStrings.moneyOut.tr, style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.7))),
                            const SizedBox(height: Dimensions.textToTextSpace),
                            Text(controller.totalMoneyOut, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        CustomBottomSheet(
                          isNeedMargin: true,
                          child: const InsightMoneyOutSheetWidget()
                        ).customBottomSheet(context);
                      },
                      child: Container(
                          height: 30, width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: MyColor.transparentColor, shape: BoxShape.circle),
                        child: Image.asset(MyImages.dots, color: MyColor.colorBlack, height: 15, width: 15),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class InsightSection extends StatelessWidget {
  const InsightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimensions.space10),
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
                InkWell(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    color: MyColor.transparentColor,
                    padding: const EdgeInsets.all(Dimensions.space5),
                    child: Text(
                      MyStrings.selectOne,
                      textAlign: TextAlign.center,
                      style: regularSmall.copyWith(color: MyColor.getPrimaryColor()),
                    ),
                  ),
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(MyStrings.moneyIn, style: regularDefault.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(width: Dimensions.space5),
                          Text(
                              "( Last 7 days )", // dynamic hobe
                              style: regularSmall.copyWith(color: MyColor.colorGrey.withOpacity(0.5))
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.space10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.totalMoneyIn, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(height: Dimensions.space10),
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              MyStrings.totalReceived.tr,
                              textAlign: TextAlign.center,
                              style: regularDefault.copyWith(decoration: TextDecoration.underline, color: MyColor.getTextColor().withOpacity(0.5)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.requestMoneyScreen);
                            },
                            child: Text(
                              MyStrings.requestMoney.tr,
                              style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.transactionHistoryScreen);
                            },
                            child: Text(
                              MyStrings.viewTransactions.tr,
                              style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.space10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(MyStrings.moneyOut, style: regularDefault.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(width: Dimensions.space5),
                          Text(
                              "( Last 7 days )", // dynamic
                              style: regularSmall.copyWith(color: MyColor.colorGrey.withOpacity(0.5))
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.space10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.totalMoneyOut, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(height: Dimensions.space10),
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              MyStrings.totalSpent.tr,
                              textAlign: TextAlign.center,
                              style: regularDefault.copyWith(decoration: TextDecoration.underline, color: MyColor.getTextColor().withOpacity(0.5)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.transferMoneyScreen);
                            },
                            child: Text(
                              MyStrings.sendMoney.tr,
                              style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.transactionHistoryScreen);
                            },
                            child: Text(
                              MyStrings.viewTransactions.tr,
                              style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

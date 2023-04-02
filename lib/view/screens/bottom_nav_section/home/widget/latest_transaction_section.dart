import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/no_data.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/latest_transaction__bottom_sheet.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/latest_transaction_card.dart';

class LatestTransactionSection extends StatelessWidget {
  const LatestTransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyStrings.latestTransactions.tr,
                  style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.transactionHistoryScreen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: MyColor.transparentColor,
                    padding: const EdgeInsets.all(Dimensions.space5),
                    child: Text(
                      MyStrings.seeAll.tr,
                      textAlign: TextAlign.center,
                      style: regularSmall.copyWith(color: MyColor.getPrimaryColor()),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimensions.space20),
            controller.trxList.isEmpty ? const Center(
              child: NoDataWidget(margin: 12),
            ) : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.trxList.length,
                itemBuilder: (context, index) {
                  return LatestTransactionCard(
                    index: index,
                    isShowDivider: controller.trxList.length-1!=index,
                    press: () => CustomBottomSheet(
                        child: LatestTransactionBottomSheet(index: index)
                    ).customBottomSheet(context)
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

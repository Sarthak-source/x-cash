import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

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
            const CustomDivider(space: Dimensions.space15),
            controller.trxList.isEmpty ? const Center(
              child: NoDataOrInternetScreen(),
            ) : ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.trxList.length,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index) {
                  return  GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space10),
                        decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35, width: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: controller.trxList[index].trxType == "-" ? MyColor.colorRed.withOpacity(0.2) : MyColor.colorGreen.withOpacity(0.2),
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                      controller.trxList[index].trxType == "-" ? Icons.arrow_upward : Icons.arrow_downward,
                                      color: controller.trxList[index].trxType == "-" ? MyColor.colorRed : MyColor.colorGreen,
                                      size: 20,
                                  )
                                ),
                                const SizedBox(width: Dimensions.space10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.trxList[index].remark}".replaceAll("_", " ").toUpperCase(),
                                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      controller.trxList[index].details ?? "",
                                      style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  DateConverter.isoStringToLocalDateOnly(controller.trxList[index].createdAt ?? ""),
                                  style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                                ),
                                const SizedBox(height: Dimensions.space10),
                                Text(
                                  "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.trxList[index].amount ?? "")} ${controller.trxList[index].currency?.currencyCode ?? ""}",
                                  style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

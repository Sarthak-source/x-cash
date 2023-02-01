import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';

class LatestTransactionCard extends StatelessWidget {
  final int index;
  final VoidCallback press;
  const LatestTransactionCard({Key? key, required this.index, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
          onTap: press,
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
      ),
    );
  }
}

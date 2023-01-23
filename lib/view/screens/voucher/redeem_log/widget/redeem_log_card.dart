import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/redeem_log_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/default_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';

class RedeemLogCard extends StatelessWidget {
  final int index;
  const RedeemLogCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemLogController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: MyStrings.voucherCode, textStyle: regularSmall.copyWith(color: MyColor.getLabelTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(text: controller.redeemLogList[index].voucherCode ?? "", textColor: MyColor.getTextColor())
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: MyStrings.usedAt, textStyle: regularSmall.copyWith(color: MyColor.getLabelTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                        text: DateConverter.isoStringToLocalDateOnly(controller.redeemLogList[index].createdAt ?? ""),
                        textColor: MyColor.getTextColor()
                    )
                  ],
                ),
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: MyStrings.amount, textStyle: regularSmall.copyWith(color: MyColor.getLabelTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                        text: Converter.twoDecimalPlaceFixedWithoutRounding(controller.redeemLogList[index].amount ?? ""),
                        textColor: MyColor.getTextColor()
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
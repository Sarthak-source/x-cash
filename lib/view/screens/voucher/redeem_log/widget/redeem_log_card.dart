import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/voucher/redeem_log_controller.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/default_text.dart';

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
                DefaultText(text: MyStrings.voucherCode.tr, textColor: MyColor.getLabelTextColor().withOpacity(0.6)),
                const SizedBox(height: Dimensions.space5),
                DefaultText(text: controller.redeemLogList[index].voucherCode ?? "", textColor: MyColor.getTextColor())
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                    header: MyStrings.amount.tr,
                    body: Converter.formatNumber(controller.redeemLogList[index].amount ?? "")
                ),
                CardColumn(
                    alignmentEnd: true,
                    header: MyStrings.usedAt.tr,
                    body: DateConverter.isoStringToLocalDateOnly(controller.redeemLogList[index].createdAt ?? "")
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

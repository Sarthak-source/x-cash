import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/default_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class AddMoneyHistoryCard extends StatelessWidget {
  final int index;
  const AddMoneyHistoryCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMoneyHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.colorWhite, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: MyStrings.trx, textStyle: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: controller.depositList[index].trx ?? "",
                      textColor: MyColor.colorBlack,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmallText(text: MyStrings.date, textStyle: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: DateConverter.isoStringToLocalDateOnly(controller.depositList[index].createdAt ?? ""),
                      textColor: MyColor.colorBlack,
                    )
                  ],
                ),
              ],
            ),
            const CustomDivider(space: Dimensions.space10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: MyStrings.amount, textStyle: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.depositList[index].finalAmo ?? "")} ${controller.depositList[index].methodCurrency}",
                      textColor: MyColor.colorBlack,
                    )
                  ],
                ),
                StatusWidget(
                    status: controller.getStatusOrColor(index),
                    color: controller.getStatusOrColor(index,isStatus: false)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

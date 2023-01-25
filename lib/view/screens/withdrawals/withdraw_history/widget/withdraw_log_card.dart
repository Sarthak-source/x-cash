import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/default_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/withdraw_status_btn.dart';

class WithdrawLogCard extends StatelessWidget {
  final int index;
  const WithdrawLogCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHistoryController>(
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
                    SmallText(text: MyStrings.trx, textStyle: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: controller.withdrawList[index].trx ?? "",
                      textColor: MyColor.colorBlack,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmallText(text: MyStrings.date, textStyle: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: DateConverter.isoStringToLocalDateOnly(controller.withdrawList[index].createdAt ?? ""),
                      textColor: MyColor.colorBlack,
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
                    SmallText(text: MyStrings.amount, textStyle: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    DefaultText(
                      text: "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawList[index].finalAmount ?? "")} ${controller.withdrawList[index].currency}",
                      textColor: MyColor.colorBlack,
                    )
                  ],
                ),
                WithdrawStatusBtn(status: controller.withdrawList[index].status??'')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

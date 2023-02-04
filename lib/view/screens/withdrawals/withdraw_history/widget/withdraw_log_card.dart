import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/default_text.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class WithdrawLogCard extends StatelessWidget {
  final int index;
  final VoidCallback? press;
  const WithdrawLogCard({
    Key? key,
    required this.index,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHistoryController>(
        builder: (controller) => GestureDetector(
          onTap: press,
          child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space15),
          decoration: BoxDecoration(color: MyColor.colorWhite, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardColumn(
                      header: MyStrings.trx.tr,
                      body: controller.withdrawList[index].trx ?? ""
                  ),
                  CardColumn(
                      alignmentEnd: true,
                      header: MyStrings.date.tr,
                      body: DateConverter.isoStringToLocalDateOnly(controller.withdrawList[index].createdAt ?? "")
                  )
                ],
              ),
              const CustomDivider(space: Dimensions.space10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardColumn(
                      header: MyStrings.amount.tr,
                      body: "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawList[index].finalAmount ?? "")} ${controller.withdrawList[index].currency}"
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
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/add-money/add_money_history/widget/add_money_history_bottom_sheet.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class AddMoneyHistoryCard extends StatelessWidget {
  final int index;
  const AddMoneyHistoryCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMoneyHistoryController>(
      builder: (controller) => GestureDetector(
        onTap: () => CustomBottomSheet(
          child: AddMoneyHistoryBottomSheet(index: index)
        ).customBottomSheet(context),
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
                      header: MyStrings.trx,
                      body: controller.depositList[index].trx ?? ""
                  ),
                  CardColumn(
                      alignmentEnd: true,
                      header: MyStrings.date,
                      body: DateConverter.isoStringToLocalDateOnly(controller.depositList[index].createdAt ?? "")
                  ),
                ],
              ),
              const CustomDivider(space: Dimensions.space10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardColumn(
                      header: MyStrings.amount,
                      body: "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.depositList[index].finalAmo ?? "")} ${controller.depositList[index].methodCurrency}"
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

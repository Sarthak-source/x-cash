import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class LatestTransactionBottomSheet extends StatelessWidget {
  final int index;
  const LatestTransactionBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.details),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.transactionId,
                body: controller.trxList[index].trx ?? "",
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.wallet,
                body: controller.trxList[index].currency?.currencyCode ?? "",
              )
            ],
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.beforeCharge,
                body: "${Converter.formatNumber(controller.trxList[index].beforeCharge ?? "")} "
                    "${controller.trxList[index].currency?.currencyCode ?? ""}",
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.charge,
                body: "${controller.trxList[index].chargeType ?? ""} "
                    "${Converter.formatNumber(controller.trxList[index].charge ?? "")} "
                    "${controller.trxList[index].currency?.currencyCode ?? ""}",
              )
            ],
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.remainingBalance,
                body: "${Converter.formatNumber(controller.trxList[index].postBalance ?? "")} ${controller.trxList[index].currency?.currencyCode ?? ""}",
              ),
            ],
          )
        ],
      ),
    );
  }
}

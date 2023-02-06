import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';

class TransactionCard extends StatelessWidget {
  final int index;
  final VoidCallback press;
  const TransactionCard({Key? key, required this.index, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionHistoryController>(
      builder: (controller) => GestureDetector(
          onTap: press,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space10),
            decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 35, width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.transactionList[index].trxType == "-" ? MyColor.colorRed.withOpacity(0.2) : MyColor.colorGreen.withOpacity(0.2),
                            shape: BoxShape.circle
                        ),
                        child: Icon(
                          controller.transactionList[index].trxType == "-" ? Icons.arrow_upward : Icons.arrow_downward,
                          color: controller.transactionList[index].trxType == "-" ? MyColor.colorRed : MyColor.colorGreen,
                          size: 20,
                        )
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.transactionList[index].remark}".replaceAll("_", " ").toTitleCase(),
                          style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: Dimensions.space10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            controller.transactionList[index].details ?? "",
                            style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateConverter.isoStringToLocalDateOnly(controller.transactionList[index].createdAt ?? ""),
                      style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                    ),
                    const SizedBox(height: Dimensions.space10),
                    Text(
                        "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.transactionList[index].amount ?? "")} ${controller.transactionList[index].currency?.currencyCode ?? ""}",
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

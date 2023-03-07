import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/invoice_history_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class InvoiceCard extends StatelessWidget {
  final int index;
  const InvoiceCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyStrings.invoicesTo.tr, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    Text(
                      controller.invoiceList[index].invoiceTo ?? "",
                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.date.tr, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    Text(
                      DateConverter.isoStringToLocalDateOnly(controller.invoiceList[index].createdAt ?? ""),
                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            const CustomDivider(space: Dimensions.space10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyStrings.amount.tr, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    Text(
                      "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.invoiceList[index].totalAmount ?? "")} "
                          "${controller.invoiceList[index].currency?.currencyCode ?? ""}",
                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.status.tr, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                    const SizedBox(height: Dimensions.space5),
                    StatusWidget(
                      status: controller.getStatusOrColor(index),
                      color: controller.getStatusOrColor(index, isStatus: false),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

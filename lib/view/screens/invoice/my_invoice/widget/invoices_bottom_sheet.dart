import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/invoice_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';

import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/widget/invoice_action_button.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class InvoicesBottomSheet{

  static void bottomSheet(BuildContext context, int index){

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: MyColor.transparentColor,
      context: context,
      builder: (context) => GetBuilder<InvoiceHistoryController>(
        builder: (controller) => SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: const BorderRadius.vertical(top: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BottomSheetHeaderText(text: MyStrings.invoiceDetails),
                    BottomSheetCloseButton()
                  ],
                ),
                const CustomDivider(space: Dimensions.space15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyStrings.invoicesTo,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Text(
                          controller.invoiceList[index].invoiceTo ?? "",
                          style: regularDefault.copyWith(color: MyColor.getTextColor()),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          MyStrings.date,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Text(
                          DateConverter.isoStringToLocalDateOnly(controller.invoiceList[index].createdAt ?? ""),
                          style: regularDefault.copyWith(color: MyColor.getTextColor()),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.space15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyStrings.email,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Text(
                          controller.invoiceList[index].email ?? "",
                          style: regularDefault.copyWith(color: MyColor.getTextColor()),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          MyStrings.paymentStatus,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        StatusWidget(
                          status: controller.getPaymentStatusOrColor(index),
                          color: controller.getPaymentStatusOrColor(index, isStatus: false),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.space15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyStrings.amount,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        Text(
                          "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.invoiceList[index].totalAmount ?? "",)} ${controller.invoiceList[index].currency?.currencyCode ?? ""}",
                          style: regularDefault.copyWith(color: MyColor.getTextColor()),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          MyStrings.status,
                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                        ),
                        const SizedBox(height: Dimensions.space5),
                        StatusWidget(
                          status: controller.getStatusOrColor(index),
                          color: controller.getStatusOrColor(index, isStatus: false),
                        )
                      ],
                    )
                  ],
                ),
                const CustomDivider(space: Dimensions.space15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InVoiceActionButton(
                        press: (){},
                        text: MyStrings.copy,
                        bgColor: MyColor.colorGreen,
                        iconData: Icons.copy_sharp,
                      ),
                    ),
                    const SizedBox(width: Dimensions.space15),
                    controller.invoiceList[index].status == "0" ? Expanded(
                      child: InVoiceActionButton(
                        press: (){},
                        text: MyStrings.edit,
                        bgColor: MyColor.primaryColor,
                        iconData: Icons.edit_calendar_sharp,
                      ),
                    ) : Expanded(
                      child: InVoiceActionButton(
                        press: (){},
                        text: MyStrings.view,
                        bgColor: MyColor.colorBlack,
                        iconData: Icons.visibility,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
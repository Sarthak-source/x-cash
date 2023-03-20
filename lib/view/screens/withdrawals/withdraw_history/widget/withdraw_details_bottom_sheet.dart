import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class WithdrawDetailsBottomSheet extends StatelessWidget {
  final int index;
  const WithdrawDetailsBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHistoryController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetBar(),
          const SizedBox(height: Dimensions.space15),
          const BottomSheetHeaderText(text: MyStrings.withdrawInfo),
          const SizedBox(height: Dimensions.space15),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                    header: MyStrings.trxId,
                    body: controller.withdrawList[index].trx ?? ""
                ),
                CardColumn(
                    alignmentEnd: true,
                    header: MyStrings.gateway,
                    body: controller.withdrawList[index].method?.name ?? "-----"
                ),
              ]
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(MyStrings.amount, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                      const SizedBox(width: Dimensions.space5),
                      Text(
                        "(${Converter.formatNumber(controller.withdrawList[index].amount ?? "")} - ${Converter.formatNumber(controller.withdrawList[index].charge ?? "")} "
                            "${controller.withdrawList[index].curr?.currencyCode ?? ""})",
                        style: regularSmall.copyWith(color: MyColor.colorRed, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Text(
                      "${Converter.formatNumber(controller.withdrawList[index].finalAmount ?? "")} "
                          "${controller.withdrawList[index].curr?.currencyCode ?? ""}",
                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis
                  )
                ],
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.date,
                body: DateConverter.isoStringToLocalDateOnly(controller.withdrawList[index].createdAt ?? ""),
              )
            ],
          ),
          const SizedBox(height: Dimensions.space20),
          controller.withdrawList[index].withdrawInformation == null ? const SizedBox() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BottomSheetHeaderText(text: MyStrings.details),
              const SizedBox(height: Dimensions.space15),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: controller.withdrawList[index].withdrawInformation?.length ?? 0,
                  separatorBuilder: (context, detailIndex) => const SizedBox(height: Dimensions.space10),
                  itemBuilder: (context, detailIndex){
                    return controller.withdrawList[index].withdrawInformation![detailIndex].type == "file" ? const SizedBox() : Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.withdrawList[index].withdrawInformation![detailIndex].name ?? "",
                            style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6)),
                          ),
                          const SizedBox(width: Dimensions.space15),
                          Flexible(
                            child: Text(
                              Converter.removeQuotationAndSpecialCharacterFromString(controller.withdrawList[index].withdrawInformation![detailIndex].value!.toList().toString()),
                              style: regularDefault.copyWith(color: MyColor.colorBlack, overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}

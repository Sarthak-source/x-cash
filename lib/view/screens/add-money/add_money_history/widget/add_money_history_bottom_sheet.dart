import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class AddMoneyHistoryBottomSheet extends StatelessWidget {

  final int index;
  const AddMoneyHistoryBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMoneyHistoryController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetHeaderRow(header: MyStrings.addMoneyInfo,bottomSpace: 0,),
          const SizedBox(height: Dimensions.space20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CardColumn(
                  header: MyStrings.trxId,
                  body: controller.depositList[index].trx ?? ""
              ),),
              Expanded(
                child: CardColumn(
                    alignmentEnd: true,
                    header: MyStrings.gateWay,
                    body: controller.depositList[index].gateway?.name ?? "-----"
                ),
              )
            ],
          ),
          const SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(MyStrings.amount.tr, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                      const SizedBox(width: Dimensions.space5),
                      Text(
                        "(${Converter.formatNumber(controller.depositList[index].amount ?? "")} + ${Converter.formatNumber(controller.depositList[index].charge ?? "")} "
                            "${controller.depositList[index].currency?.currencyCode ?? ""})",
                        style: regularSmall.copyWith(color: MyColor.colorRed, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Text(
                      "${Converter.formatNumber(controller.depositList[index].finalAmo ?? "")} "
                          "${controller.depositList[index].currency?.currencyCode ?? ""}",
                      style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis
                  )
                ],
              ),),
              Expanded(
                flex: 3,
                child: CardColumn(
                alignmentEnd: true,
                header: MyStrings.date,
                body: DateConverter.isoStringToLocalDateOnly(controller.depositList[index].createdAt ?? ""),
              ))
            ],
          ),
          const SizedBox(height: Dimensions.space20),
          controller.depositList[index].detail == null ? const SizedBox() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BottomSheetHeaderText(text: MyStrings.details),
              const SizedBox(height: Dimensions.space15),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: controller.depositList[index].detail?.length ?? 0,
                  separatorBuilder: (context, detailIndex) => const SizedBox(height: Dimensions.space10),
                  itemBuilder: (context, detailIndex) {

                    if(controller.depositList[index].detail?[detailIndex].type=='file'){
                      return const SizedBox.shrink();
                    }

                    return BottomSheetCard(
                      bottomSpace: Dimensions.space5,
                      child:
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.depositList[index].detail?[detailIndex].name?.tr ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6),fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              controller.depositList[index].detail?[detailIndex].value?.tr ?? "",
                              style: regularDefault.copyWith(color: MyColor.colorBlack,fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
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

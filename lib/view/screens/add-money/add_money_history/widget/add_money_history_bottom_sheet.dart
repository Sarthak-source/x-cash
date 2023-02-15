import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class AddMoneyHistoryBottomSheet{

  static void addMoneyHistoryBottomSheet({required BuildContext context, required int index}){

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return GetBuilder<AddMoneyHistoryController>(
            builder: (controller) => SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: MyColor.colorWhite,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  child: Column(
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
                            header: MyStrings.trxId,
                            body: controller.depositList[index].trx ?? ""
                          ),
                          CardColumn(
                            alignmentEnd: true,
                            header: MyStrings.gateWay,
                            body: controller.depositList[index].gateway?.name ?? "-----"
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
                              Row(
                                children: [
                                  Text(MyStrings.amount, style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.6))),
                                  const SizedBox(width: Dimensions.space5),
                                  Text(
                                    "(${Converter.twoDecimalPlaceFixedWithoutRounding(controller.depositList[index].amount ?? "")} + ${Converter.twoDecimalPlaceFixedWithoutRounding(controller.depositList[index].charge ?? "")} "
                                        "${controller.depositList[index].currency?.currencyCode ?? ""})",
                                    style: regularSmall.copyWith(color: MyColor.colorRed, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const SizedBox(height: Dimensions.space5),
                              Text(
                                "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.depositList[index].finalAmo ?? "")} "
                                    "${controller.depositList[index].currency?.currencyCode ?? ""}",
                                style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis
                              )
                            ],
                          ),
                          CardColumn(
                            alignmentEnd: true,
                            header: MyStrings.date,
                            body: DateConverter.isoStringToLocalDateOnly(controller.depositList[index].createdAt ?? ""),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimensions.space20),
                      ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: controller.depositList[index].detail?.length ?? 0,
                        separatorBuilder: (context, detailIndex) => const SizedBox(height: Dimensions.space10),
                        itemBuilder: (context, detailIndex) => Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: Dimensions.space12, horizontal: Dimensions.space15),
                          decoration: BoxDecoration(
                            color: MyColor.transparentColor,
                            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                            border: Border.all(color: MyColor.colorBlack.withOpacity(0.5), width: 0.5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.depositList[index].detail![detailIndex].name ?? "",
                                style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6)),
                              ),
                              Text(
                                controller.depositList[index].detail![detailIndex].value ?? "",
                                style: regularDefault.copyWith(color: MyColor.colorBlack),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  )
              ),
            ),
          );
        }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/voucher_list_controller.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class VoucherListCard extends StatefulWidget {
  final ScrollController scrollController;
  const VoucherListCard({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<VoucherListCard> createState() => _VoucherListCardState();
}

class _VoucherListCardState extends State<VoucherListCard> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoucherListController>(
      builder: (controller) => ListView.separated(
          controller: widget.scrollController,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.voucherList.length,
          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
          itemBuilder: (context, index) => CustomCard(
            paddingTop: Dimensions.space15,
            paddingBottom: Dimensions.space15,
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.voucherList[index].voucherCode ?? "",
                      style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                    ),
                    Text(
                      DateConverter.isoStringToLocalDateOnly(controller.voucherList[index].createdAt ?? ""),
                      style: regularDefault.copyWith(color: MyColor.getTextColor()),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.space10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${Converter.formatNumber(controller.voucherList[index].amount ?? "")} "
                      "${controller.voucherList[index].currency?.currencyCode ?? ""}",
                      style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: controller.voucherList[index].isUsed == "0" ? MyColor.colorOrange : MyColor.colorGreen)
                      ),
                      child: Text(
                        controller.voucherList[index].isUsed == "0" ? controller.notUsed : controller.used,
                        style: regularExtraSmall.copyWith(
                            color: controller.voucherList[index].isUsed == "0" ? MyColor.colorOrange : MyColor.colorGreen
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomDivider(space: Dimensions.space15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${MyStrings.usedAt.tr}: ", style: regularSmall),
                    Text(
                      controller.voucherList[index].isUsed == "0" ? "N/A" : DateConverter.isoStringToLocalDateOnly(controller.voucherList[index].createdAt ?? ""),
                      style: regularDefault
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

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
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

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
          itemCount: controller.voucherList.length+1,
          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
          itemBuilder: (context, index) {
            if(controller.voucherList.length==index){
              return controller.hasNext()?const CustomLoader(isPagination: true):const SizedBox.shrink();
            }
            return CustomCard(
              paddingTop: Dimensions.space15,
              paddingBottom: Dimensions.space15,
              width: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardColumn(header: MyStrings.voucherCode, body: controller.voucherList[index].voucherCode ?? "",),
                      CardColumn(alignmentEnd:true,header: MyStrings.initiated, body: DateConverter.isoStringToLocalDateOnly(controller.voucherList[index].createdAt ?? "",))
                    ],
                  ),
                  const CustomDivider(space: Dimensions.space15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardColumn(header: MyStrings.amount, body: "${Converter.formatNumber(controller.voucherList[index].amount ?? "")} "),
                      //StatusWidget(status: controller.voucherList[index].isUsed == "0" ? controller.notUsed : controller.used, color: controller.voucherList[index].isUsed == "0" ? MyColor.colorOrange : MyColor.colorGreen),
                      CardColumn(alignmentEnd:true,header: MyStrings.usedAt, body: controller.voucherList[index].isUsed == "0" ? "N/A" : DateConverter.isoStringToLocalDateOnly(controller.voucherList[index].createdAt ?? "")),
                    ],
                  ),
                  const SizedBox(height: Dimensions.space15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StatusWidget(status: controller.voucherList[index].isUsed == "0" ? MyStrings.notUsed : MyStrings.used, color: controller.voucherList[index].isUsed == "0" ? MyColor.colorOrange : MyColor.colorGreen)
                      /*Text('${MyStrings.usedAt.tr}: ',style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: Dimensions.space5),
                    Text(controller.voucherList[index].isUsed == "0" ? "N/A" : DateConverter.isoStringToLocalDateOnly(controller.voucherList[index].createdAt ?? ""), style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)*/
                    ],
                  )
                  //
                ],
              ),
            );
          }
      ),
    );
  }
}

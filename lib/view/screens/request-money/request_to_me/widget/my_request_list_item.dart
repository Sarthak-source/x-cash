import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/view/components/buttons/card_button.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class MyRequestListItem extends StatelessWidget {

  final int index;

  const MyRequestListItem({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                    header: MyStrings.requestTo.tr,
                    body: "${controller.myRequestList[index].receiver?.firstname ?? "-"} ${controller.myRequestList[index].receiver?.lastname ?? "-"}"
                ),
                CardColumn(
                    header: MyStrings.date.tr,
                    body: DateConverter.isoStringToLocalDateOnly(controller.myRequestList[index].createdAt ?? ""),
                    alignmentEnd: true
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                    header: MyStrings.amount.tr,
                    body: "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.myRequestList[index].requestAmount ?? "")} "
                    "${controller.myRequestList[index].currency?.currencyCode ?? ""}"
                ),
                CardButton(
                  isText: false,
                  bgColor: MyColor.colorGrey.withOpacity(0.2),
                  contentColor: MyColor.colorBlack,
                  icon: Icons.visibility,
                  press: (){},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

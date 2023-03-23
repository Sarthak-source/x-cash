import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';

class MainItemHistory extends StatelessWidget {
  const MainItemHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller)=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.space15, bottom: Dimensions.space15, right: Dimensions.space15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(MyStrings.history, style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(width: Dimensions.space10),
              Expanded(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: MyColor.colorGrey.withOpacity(0.2)),
                ),
              )
            ],
          ),
        ),
        controller.historyModuleList.length>4?Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ...controller.historyModuleList
                .getRange(0, 4)
                .map((item) => SizedBox(
              width:
              (MediaQuery.of(context).size.width -
                  32 -
                  24) /
                  4,
              // 32 is the total horizontal padding, 24 is the total horizontal spacing
              child: item,
            ))
                .toList(),
            ...controller.historyModuleList
                .getRange(4, controller.historyModuleList.length)
                .map((item) => SizedBox(
              width:
              (MediaQuery.of(context).size.width -
                  32 -
                  24) /
                  4,
              child: item,
            ))
                .toList(),
          ],
        ):
        controller.historyModuleList.length == 4
            ? Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: controller.historyModuleList[0]),
            Expanded(child: controller.historyModuleList[1]),
            Expanded(child: controller.historyModuleList[2]),
            Expanded(child: controller.historyModuleList[3]),
          ],
        ):
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ...controller.historyModuleList
                .getRange(0, controller.historyModuleList.length)
                .map((item) => SizedBox(
              width:
              (MediaQuery.of(context).size.width -
                  32 -
                  24) /
                  4,
              child: item,
            ))
                .toList(),
          ],
        ),
        const SizedBox(height: Dimensions.space20),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/animated_widget/expanded_widget.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/main_item_history.dart';

class MainItemSection extends StatelessWidget {
  const MainItemSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            vertical: Dimensions.space15, horizontal: Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getCardBgColor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.moduleList.length == 8
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: controller.moduleList[0]),
                          Expanded(child: controller.moduleList[1]),
                          Expanded(child: controller.moduleList[2]),
                          Expanded(child: controller.moduleList[3]),
                        ],
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: controller.moduleList[4]),
                          Expanded(child: controller.moduleList[5]),
                          Expanded(child: controller.moduleList[6]),
                          Expanded(child: controller.moduleList[7]),
                        ],
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.moduleList.length > 4
                          ? Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                ...controller.moduleList
                                    .getRange(0, 4)
                                    .map((item) => SizedBox(
                                          width: (MediaQuery.of(context).size.width - 32 - 24) / 4,
                                          child: item,
                                        ))
                                    .toList(),
                                ...controller.moduleList
                                    .getRange(4, controller.moduleList.length)
                                    .map((item) => SizedBox(
                                          width: (MediaQuery.of(context).size.width - 32 - 24) / 4,
                                          child: item,
                                        ))
                                    .toList(),
                              ],
                            )
                          : controller.moduleList.length == 4
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: controller.moduleList[0]),
                                    Expanded(child: controller.moduleList[1]),
                                    Expanded(child: controller.moduleList[2]),
                                    Expanded(child: controller.moduleList[3]),
                                  ],
                                )
                              : Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: [
                                    ...controller.moduleList
                                        .getRange(0, controller.moduleList.length)
                                        .map((item) => SizedBox(
                                              width: (MediaQuery.of(context).size.width - 32 - 24) / 4,
                                              child: item,
                                            ))
                                        .toList(),
                                  ],
                                ),
                    ],
                  ),
            const SizedBox(height: Dimensions.space20),
            ExpandedSection(
              duration: 800,
              expand: controller.isVisibleItem,
              child: const MainItemHistory(),
            ),
            GestureDetector(
                onTap: () => controller.visibleItem(),
                child: Center(
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: Image.asset(
                      controller.isVisibleItem
                          ? MyImages.arrowUp
                          : MyImages.arrowDown,
                      color: controller.isVisibleItem
                          ? MyColor.primaryColor
                          : MyColor.colorGrey.withOpacity(0.3),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

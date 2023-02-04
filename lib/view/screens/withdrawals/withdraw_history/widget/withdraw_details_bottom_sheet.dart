import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.details),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(space: Dimensions.space10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: controller.withdrawList[index].withdrawInformation?.length ?? 0,
            separatorBuilder: (context, infoIndex) => const SizedBox(height: Dimensions.space10),
            itemBuilder: (context, infoIndex) => Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(Dimensions.space10),
              decoration: BoxDecoration(
                  color: MyColor.getCardBgColor(),
                  border: Border.all(color: MyColor.colorBlack.withOpacity(0.6), width: 0.5),
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.withdrawList[index].withdrawInformation![infoIndex].name ?? "",
                    style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
                    child: Text(
                      Converter.removeQuotationAndSpecialCharacterFromString(controller.withdrawList[index].withdrawInformation![infoIndex].value!.toList().toString()),
                      style: regularSmall.copyWith(color: MyColor.getTextColor()),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

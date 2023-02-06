import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/row_widget/bottom_sheet_row.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class BalanceBottomSheet extends StatefulWidget {
  const BalanceBottomSheet({Key? key}) : super(key: key);

  @override
  State<BalanceBottomSheet> createState() => _BalanceBottomSheetState();
}

class _BalanceBottomSheetState extends State<BalanceBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 5, width: 50,
              decoration: BoxDecoration(color: MyColor.colorGrey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: Dimensions.space20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BottomSheetHeaderText(text: MyStrings.xCashBalance),
              BottomSheetHeaderText(text: controller.userBalance)
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5)
            ),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.walletList.length,
              separatorBuilder: (context, index) => const CustomDivider(space: Dimensions.space12),
              itemBuilder: (context, index) => BottomSheetRow(
                  header: controller.walletList[index].currencyCode ?? "",
                  body: "${controller.walletList[index].currency?.currencySymbol ?? ""} ${Converter.twoDecimalPlaceFixedWithoutRounding(controller.walletList[index].balance ?? "")}"
              ),
            ),
          )
        ],
      ),
    );
  }
}

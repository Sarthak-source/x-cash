import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/add_money/add_money_method_controller.dart';
import 'package:xcash_app/view/screens/add-money/add_money/widget/custom_row.dart';

class AddMoneyInfoWidget extends StatelessWidget {
  const AddMoneyInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMoneyMethodController>(
      builder: (controller) =>  Container(
        padding: const EdgeInsets.all(Dimensions.space15),
        decoration: BoxDecoration(
          color: MyColor.getCardBgColor(),
          borderRadius: BorderRadius.circular(Dimensions.space10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRow(firstText: MyStrings.amount, lastText: "${controller.mainAmount.toString()} ${controller.currency}"),
            const SizedBox(height: Dimensions.space10),
            CustomRow(firstText: MyStrings.charge, lastText: controller.charge),
            const SizedBox(height: Dimensions.space10),
            CustomRow(firstText: MyStrings.payable, lastText: controller.payableText),
          ],
        ),
      ),
    );
  }
}

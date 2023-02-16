import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/add_money/add_money_method_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
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
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRow(
                showImage: true,
                imageSrc: MyImages.amount,
                firstText: MyStrings.amount,
                lastText: "${controller.mainAmount.toString()} ${controller.currency}"
            ),
            const CustomDivider(space: Dimensions.space15),
            CustomRow(
                showImage: true,
                imageSrc: MyImages.charge,
                firstText: MyStrings.charge,
                lastText: controller.charge
            ),
            const CustomDivider(space: Dimensions.space15),
            CustomRow(
                showImage: true,
                imageSrc: MyImages.payable,
                firstText: MyStrings.payable,
                lastText: controller.payableText
            ),
          ],
        ),
      ),
    );
  }
}

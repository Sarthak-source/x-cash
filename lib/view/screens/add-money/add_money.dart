import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/add-money/widget/add_money_form.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BottomSheetHeaderText(text: MyStrings.addMoneyDetails),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 30, width: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(color: MyColor.primaryColor100, shape: BoxShape.circle),
                child: const Icon(Icons.clear, color: MyColor.colorBlack, size: 15),
              ),
            )
          ],
        ),

        const CustomDivider(),

        const AddMoneyForm()
      ],
    );
  }
}


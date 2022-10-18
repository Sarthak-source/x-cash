import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
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
        )
      ],
    );
  }
}

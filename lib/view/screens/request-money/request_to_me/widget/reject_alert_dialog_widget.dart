import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class RejectAlertDialogWidget extends StatelessWidget {
  const RejectAlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 55, width: 55,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: MyColor.secondaryScreenBgColor, shape: BoxShape.circle),
          child: Image.asset("", color: MyColor.primaryColor, height: 25, width: 25),
        ),
        const SizedBox(height: Dimensions.space10),
        const BottomSheetHeaderText(text: "Are you sure want to reject?"),
        const CustomDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                    color: MyColor.secondaryScreenBgColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                    "No",
                    textAlign: TextAlign.center,
                    style: regularDefault.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w500)
                ),
              ),
            ),

            const SizedBox(width: Dimensions.space15),

            GestureDetector(
              onTap: (){},
              child: Container(
                height: 40,
                width: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                    "Yes",
                    textAlign: TextAlign.center,
                    style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

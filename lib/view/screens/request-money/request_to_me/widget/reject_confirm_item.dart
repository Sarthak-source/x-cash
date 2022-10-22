import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class RejectConfirmItem extends StatelessWidget {
  const RejectConfirmItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){},
          child: Row(
            children: [
              Container(
                height: 25, width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor.colorWhite,
                  border: Border.all(color: MyColor.colorBlack, width: 1.00),
                ),
                child: const Icon(Icons.clear, color: MyColor.colorBlack, size: 15),
              ),
              const SizedBox(width: Dimensions.space15),
              Text("Want to reject?", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500))
            ],
          ),
        ),

        const CustomDivider(height: Dimensions.space15),

        GestureDetector(
          onTap: (){},
          child: Row(
            children: [
              Container(
                height: 25, width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor.colorWhite,
                  border: Border.all(color: MyColor.colorBlack, width: 1.00),
                ),
                child: Image.asset(MyImages.mark, color: MyColor.colorBlack, height: 15, width: 15),
              ),
              const SizedBox(width: Dimensions.space15),
              Text("Want to confirm?", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ],
    );
  }
}

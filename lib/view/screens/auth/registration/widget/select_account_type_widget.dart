import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class SelectAccountTypeWidget extends StatelessWidget {

  final String accountType;
  final bool isActive;
  final VoidCallback press;
  final String imageSrc;

  const SelectAccountTypeWidget({
    Key? key,
    required this.accountType,
    required this.isActive,
    required this.press,
    required this.imageSrc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: Dimensions.space3, right: Dimensions.space3),
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              border: Border.all(color: isActive ? MyColor.primaryColor : MyColor.colorGrey.withOpacity(0.2))
          ),
          child: Row(
            children: [
              CircleShapeImage(
                image: imageSrc,
                imageColor: isActive ? MyColor.primaryColor : MyColor.getTextColor().withOpacity(0.3),
              ),
              const SizedBox(width: Dimensions.space12),
              Text(
                accountType.tr,
                style: regularSmall.copyWith(color: MyColor.getTextColor()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

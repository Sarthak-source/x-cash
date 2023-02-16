import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class CustomRow extends StatelessWidget {

  const CustomRow({
    Key? key,
    required this.firstText,
    required this.lastText,
    this.imageSrc,
    this.showDivider = true,
    this.showImage = false,
  }) : super(key: key);

  final String firstText,lastText;
  final bool showDivider;
  final bool showImage;
  final String? imageSrc;

  @override
  Widget build(BuildContext context) {
    return showImage ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 30, width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: MyColor.screenBgColor,
                shape: BoxShape.circle
              ),
              child: Image.asset(imageSrc!, color: MyColor.primaryColor, height: 17, width: 17),
            ),
            const SizedBox(width: Dimensions.space10),
            Text(firstText.tr, style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6)),overflow: TextOverflow.ellipsis,maxLines: 1),
          ],
        ),
        Text(lastText, maxLines:2, style: regularDefault.copyWith(color: MyColor.colorBlack),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,)
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(firstText.tr, style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6)),overflow: TextOverflow.ellipsis,maxLines: 1,)),
        Flexible(child:Text(lastText, maxLines:2, style: regularDefault.copyWith(color: MyColor.colorBlack),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,))
      ],
    );
  }
}
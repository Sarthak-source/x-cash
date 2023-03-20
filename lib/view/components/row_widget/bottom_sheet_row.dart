import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class BottomSheetRow extends StatelessWidget {

  final String header;
  final String body;
  final String? currencySymbol;
  final bool showSymbol;

  const BottomSheetRow({
    Key? key,
    required this.header,
    required this.body,
    this.showSymbol = false,
    this.currencySymbol
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showSymbol ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 35, width: 35,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: MyColor.colorBlack, shape: BoxShape.circle),
              child: Text(currencySymbol!, textAlign: TextAlign.center, style: regularDefault.copyWith(color: MyColor.colorWhite)),
            ),
            const SizedBox(width: Dimensions.space10),
            Text(header.tr, style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
          ],
        ),
        Text(body.tr,style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header.tr, style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
        Text(body.tr,style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
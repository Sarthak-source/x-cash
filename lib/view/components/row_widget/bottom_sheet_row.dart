import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class BottomSheetRow extends StatelessWidget {

  final String header;
  final String body;

  const BottomSheetRow({Key? key, required this.header,required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(header.tr, style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
        Text(body,style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class CustomRow extends StatelessWidget {

  const CustomRow({
    Key? key,
    required this.firstText,
    required this.lastText,
    this.showDivider = true
  }) : super(key: key);

  final String firstText,lastText;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(firstText, style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.6)),overflow: TextOverflow.ellipsis,maxLines: 1,)),
            Flexible(child:Text(lastText, maxLines:2, style: regularDefault.copyWith(color: MyColor.colorBlack),overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,))
          ],
        ),
      ],
    );
  }
}
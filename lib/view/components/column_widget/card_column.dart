import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class CardColumn extends StatelessWidget {

  final String header;
  final String body;
  final bool alignmentEnd;
  
  const CardColumn({Key? key,this.alignmentEnd=false,required this.header,required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignmentEnd?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        Text(header,style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),overflow: TextOverflow.ellipsis,),
        const SizedBox(height: Dimensions.space5),
        Text(body, style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)
      ],
    );
  }
}
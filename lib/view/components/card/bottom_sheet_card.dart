import 'package:flutter/material.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/util.dart';

class BottomSheetCard extends StatelessWidget {
  final Widget child;
  const BottomSheetCard({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(Dimensions.space15),
    margin: const EdgeInsets.only(top: Dimensions.space8),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
    color: MyColor.colorWhite,
    border: Border.all(width: .3,color: MyColor.colorGrey.withOpacity(.2)),
    //boxShadow: MyUtils.getBottomSheetShadow()
    ),
    child: child);
  }
}

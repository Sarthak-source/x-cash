import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CustomDivider extends StatelessWidget {

  final double height;

  const CustomDivider({
    Key? key,
    this.height = Dimensions.space20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(height: height),
        const Divider(color: MyColor.lineColor, height: 0.5, thickness: 1),
        SizedBox(height: height),
      ],
    );
  }
}

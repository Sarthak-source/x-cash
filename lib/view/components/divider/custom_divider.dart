import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CustomDivider extends StatelessWidget {

  final double space;

  const CustomDivider({
    Key? key,
    this.space = Dimensions.space20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: space),
        Divider(color: MyColor.primaryColor.withOpacity(0.2), height: 0.5, thickness: 1),
        SizedBox(height: space),
      ],
    );
  }
}

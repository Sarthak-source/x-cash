import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(MyImages.noDataImage, height: 70, width: 70, color: MyColor.primaryColor),
        const SizedBox(height: Dimensions.space15),
        Text(
          MyStrings.noDataFound,
          style: regularLarge.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
        )
      ],
    );
  }
}

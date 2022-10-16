import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          MyStrings.myWallet,
          style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500),
        ),
        Text(
          MyStrings.viewMore,
          style: interRegularSmall.copyWith(color: MyColor.colorWhite),
        )
      ],
    );
  }
}

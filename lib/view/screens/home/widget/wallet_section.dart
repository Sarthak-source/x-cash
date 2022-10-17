import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            MyStrings.myWallet,
            style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.myWalletScreen);
            },
            child: Container(
              alignment: Alignment.center,
              color: MyColor.transparentColor,
              padding: const EdgeInsets.all(Dimensions.space5),
              child: Text(
                MyStrings.viewMore,
                textAlign: TextAlign.center,
                style: interRegularSmall.copyWith(color: MyColor.colorWhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}

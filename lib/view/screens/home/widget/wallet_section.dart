import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
      decoration: BoxDecoration(color: MyColor.getCardBgColor()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.myWallet,
                style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.myWalletScreen);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: MyColor.transparentColor,
                  padding: const EdgeInsets.all(Dimensions.space5),
                  child: Text(
                    MyStrings.seeAll,
                    textAlign: TextAlign.center,
                    style: regularSmall.copyWith(color: MyColor.getPrimaryColor()),
                  ),
                ),
              )
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleShapeImage(
                            backgroundColor: MyColor.colorWhite,
                            isSvgImage: true,
                            image: MyImages.transferMoney,
                          ),
                          const SizedBox(width: Dimensions.space10),
                          Text("674,475.00 USD", style: regularLarge.copyWith(fontWeight: FontWeight.w600))
                        ],
                      ),
                      const CustomDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.transferMoney,
                            style: regularSmall.copyWith(color: MyColor.contentTextColor),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined, color: MyColor.primaryColor, size: 16)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: Dimensions.space10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleShapeImage(
                            backgroundColor: MyColor.colorWhite,
                            isSvgImage: true,
                            image: MyImages.transferMoney,
                          ),
                          const SizedBox(width: Dimensions.space10),
                          Text("674,475.00 USD", style: regularLarge.copyWith(fontWeight: FontWeight.w600))
                        ],
                      ),
                      const CustomDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.transferMoney,
                            style: regularSmall.copyWith(color: MyColor.contentTextColor),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined, color: MyColor.primaryColor, size: 16)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: Dimensions.space10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleShapeImage(
                            backgroundColor: MyColor.colorWhite,
                            isSvgImage: true,
                            image: MyImages.transferMoney,
                          ),
                          const SizedBox(width: Dimensions.space10),
                          Text("674,475.00 USD", style: regularLarge.copyWith(fontWeight: FontWeight.w600))
                        ],
                      ),
                      const CustomDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.transferMoney,
                            style: regularSmall.copyWith(color: MyColor.contentTextColor),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined, color: MyColor.primaryColor, size: 16)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

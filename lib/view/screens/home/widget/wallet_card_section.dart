import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class WalletCardSection extends StatefulWidget {
  const WalletCardSection({Key? key}) : super(key: key);

  @override
  State<WalletCardSection> createState() => _WalletCardSectionState();
}

class _WalletCardSectionState extends State<WalletCardSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 10 : 5, right: Dimensions.space10),
          child: CustomCard(
            paddingTop: 12,
            paddingBottom: 12,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleShapeImage(
                      isSvgImage: true,
                      image: MyImages.transferMoney,
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Text("674,475,999,995,140.00 USD", style: regularLarge.copyWith(fontWeight: FontWeight.w600))
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
        )
    );
  }
}

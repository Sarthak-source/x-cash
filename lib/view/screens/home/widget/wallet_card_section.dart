import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

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
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Dimensions.space10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: MyColor.primaryColor100,
                          shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset(MyImages.transferMoney, color: MyColor.primaryColor100, height: 20, width: 20),
                    ),

                    const SizedBox(width: Dimensions.space10),

                    Text("674,475,999,995,140.00 USD", style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600))
                  ],
                ),

                const CustomDivider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyStrings.transferMoney,
                      style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor),
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

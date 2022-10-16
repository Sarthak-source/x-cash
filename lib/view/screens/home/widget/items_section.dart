import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/home/widget/items_section_top_part.dart';

class ItemsSection extends StatefulWidget {
  const ItemsSection({Key? key}) : super(key: key);

  @override
  State<ItemsSection> createState() => _ItemsSectionState();
}

class _ItemsSectionState extends State<ItemsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: MyColor.primaryColor100,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      padding: const EdgeInsets.only(top: Dimensions.space30, left: Dimensions.space15, right: Dimensions.space15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemsSectionTopPart(),

            const SizedBox(height: Dimensions.space25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyStrings.insights,
                  style: interRegularDefault.copyWith(fontWeight: FontWeight.w500, height: 2.3),
                ),

                Row(
                  children: [
                    Text(
                      "Last 7 days",
                      style: interRegularSmall.copyWith(color: MyColor.primaryColor),

                    ),
                    const SizedBox(width: Dimensions.space10),
                    const Icon(Icons.arrow_drop_down, color: MyColor.primaryColor, size: 20)
                  ],
                )
              ],
            ),

            const SizedBox(height: Dimensions.space15),

            ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
              itemBuilder: (context, index) => CustomCard(
                width: MediaQuery.of(context).size.width,
                isPress: true,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: MyColor.primaryColor100,
                            shape: BoxShape.circle
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: Dimensions.space20),
          ],
        ),
      ),
    );
  }
}

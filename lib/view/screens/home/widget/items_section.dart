import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/screens/home/widget/card_list.dart';
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
      padding: const EdgeInsets.only(top: Dimensions.space30),
      decoration: const BoxDecoration(
          color: MyColor.screenBgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemsSectionTopPart(),

            const SizedBox(height: Dimensions.space25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    MyStrings.insights,
                    style: regularDefault.copyWith(fontWeight: FontWeight.w500, height: 2.3),
                  ),

                  Row(
                    children: [
                      Text(
                        "Last 7 days",
                        style: regularSmall.copyWith(color: MyColor.primaryColor),

                      ),
                      const SizedBox(width: Dimensions.space10),
                      const Icon(Icons.arrow_drop_down, color: MyColor.primaryColor, size: 20)
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: Dimensions.space15),

            const CardList(),

            const SizedBox(height: Dimensions.space20),
          ],
        ),
      ),
    );
  }
}

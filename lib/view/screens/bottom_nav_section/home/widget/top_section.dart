import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/screens/bottom_nav_section/home/widget/balance_bottom_sheet.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getPrimaryColor()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.profileScreen),
                  child: Container(
                    height: 40, width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(MyImages.profile), fit: BoxFit.fill)
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.space10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.username, style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
                    const SizedBox(height: Dimensions.space5),
                    Text(
                      controller.email,
                      style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: Dimensions.space15),
            GestureDetector(
              onTap: () => CustomBottomSheet(
                child: const BalanceBottomSheet()
              ).customBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                child: Text(MyStrings.balance.tr, style: regularSmall.copyWith(fontWeight: FontWeight.w500))
              )
            ),
          ],
        ),
      ),
    );
  }
}

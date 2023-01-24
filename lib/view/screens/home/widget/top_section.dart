import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40, width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(MyImages.userProfile), fit: BoxFit.fill)
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
            Expanded(
              child: InkWell(
                  onTap: () => controller.changeState(),
                  child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedOpacity(
                                opacity: controller.isBalanceShown ? 1 : 0,
                                duration: const Duration(milliseconds: 500),
                                child: Text(controller.userBalance, style: regularSmall.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w600))
                            ),
                            AnimatedOpacity(
                                opacity: controller.isBalance ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Text("Balance", style: regularSmall.copyWith(fontWeight: FontWeight.w500))
                            ),
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 1100),
                                left: controller.isAnimated == false ? 5 : 147,
                                curve: Curves.fastOutSlowIn,
                                child: FittedBox(
                                  child: Container(
                                    height: 15, width: 15,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
                                    child: Icon(controller.isAnimated == true ? Icons.visibility : Icons.visibility_off, color: MyColor.colorWhite, size: 10),
                                  ),
                                )
                            )
                          ]
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

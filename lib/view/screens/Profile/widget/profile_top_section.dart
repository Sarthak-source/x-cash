import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/account/profile_controller.dart';

class ProfileTopSection extends StatefulWidget {
  const ProfileTopSection({Key? key}) : super(key: key);

  @override
  State<ProfileTopSection> createState() => _ProfileTopSectionState();
}

class _ProfileTopSectionState extends State<ProfileTopSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(MyImages.profile),
            ),
            const SizedBox(height: Dimensions.space10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: Dimensions.space5),
                    Text(
                      controller.model.data?.user?.username ?? "",
                      style: regularLarge.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: Dimensions.textToTextSpace),
                    Text(
                      controller.model.data?.user?.email ?? "",
                      style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.editProfileScreen),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.space8, horizontal: Dimensions.space20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: MyColor.getPrimaryColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                    child: Text(
                      MyStrings.editProfile,
                      style: regularSmall.copyWith(color: MyColor.colorWhite),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

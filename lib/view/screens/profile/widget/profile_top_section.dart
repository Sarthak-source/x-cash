import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/account/profile_controller.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

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
            color: MyColor.getCardBgColor(),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(MyImages.profile),
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
            ),
            const SizedBox(height: Dimensions.space40),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.name),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.name,
                    body: controller.model.data?.user?.username ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.email),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.email,
                    body: controller.model.data?.user?.email ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.phone),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.phone,
                    body: controller.model.data?.user?.mobile ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.address),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.address,
                    body: controller.model.data?.user?.address?.address ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.state),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.state,
                    body: controller.model.data?.user?.address?.state ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.zipCode),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.zipCode,
                    body: controller.model.data?.user?.address?.zip ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.city),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.city,
                    body: controller.model.data?.user?.address?.city ?? ""
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              children: [
                const CircleShapeImage(image: MyImages.country),
                const SizedBox(width: Dimensions.space15),
                CardColumn(
                    header: MyStrings.country,
                    body: controller.model.data?.user?.address?.country ?? ""
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';

import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class ProfileFieldSection extends StatefulWidget {
  const ProfileFieldSection({Key? key}) : super(key: key);

  @override
  State<ProfileFieldSection> createState() => _ProfileFieldSectionState();
}

class _ProfileFieldSectionState extends State<ProfileFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MyColor.colorWhite,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.name),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.name, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("William Anne", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.paperPlan),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.email, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("williamanne123@gmail.com", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.phone),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.phone, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("04589 598 85", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.address),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.address, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("6391 Elgin St. Celina,\nDelaware 10299", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.state),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.state, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("Dhaka", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.zipCode),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.zipCode, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text(1216.toString(), style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.city),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.city, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),

              Text("Dhaka", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),

          const CustomDivider(height: Dimensions.space15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleShapeImage(image: MyImages.country),
                  const SizedBox(width: Dimensions.space15),
                  Text(MyStrings.country, style: regularDefault.copyWith(color: MyColor.contentTextColor))
                ],
              ),
              Text("Bangladesh", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: Dimensions.space30),
          RoundedButton(
              press: (){
                Get.toNamed(RouteHelper.editProfileScreen);
              },
              text: MyStrings.editProfile,
          )
        ],
      ),
    );
  }
}

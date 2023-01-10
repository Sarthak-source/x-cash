import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';

class ProfileTopSection extends StatefulWidget {
  const ProfileTopSection({Key? key}) : super(key: key);

  @override
  State<ProfileTopSection> createState() => _ProfileTopSectionState();
}

class _ProfileTopSectionState extends State<ProfileTopSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MyColor.colorWhite,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60, width: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10 / 2),
            decoration: const BoxDecoration(
                color: MyColor.screenBgColor,
                shape: BoxShape.circle,
            ),
            child: Container(
              height: 55, width: 55,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(MyImages.userProfile), fit: BoxFit.fill)
              ),
            ),
          ),

          const SizedBox(height: Dimensions.space15),

          Text(
            "William Anne",
            textAlign: TextAlign.center,
            style: regularLarge.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

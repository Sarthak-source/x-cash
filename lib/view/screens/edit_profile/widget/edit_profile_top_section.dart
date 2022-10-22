import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';

class EditProfileTopSection extends StatefulWidget {
  const EditProfileTopSection({Key? key}) : super(key: key);

  @override
  State<EditProfileTopSection> createState() => _EditProfileTopSectionState();
}

class _EditProfileTopSectionState extends State<EditProfileTopSection> {
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
          Stack(
            children: [
              Container(
                height: 65, width: 65,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10 / 2),
                decoration: const BoxDecoration(
                  color: MyColor.primaryColor100,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 60, width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(MyImages.userProfile), fit: BoxFit.fill)
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: 25, width: 25,
                    decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, color: MyColor.colorWhite, size: 12.5),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: Dimensions.space15),

          Text(
            "William Anne",
            textAlign: TextAlign.center,
            style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

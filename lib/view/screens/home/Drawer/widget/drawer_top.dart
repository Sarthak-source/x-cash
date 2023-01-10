import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';

class DrawerTop extends StatefulWidget {
  const DrawerTop({Key? key}) : super(key: key);

  @override
  State<DrawerTop> createState() => _DrawerTopState();
}

class _DrawerTopState extends State<DrawerTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.space30, left: Dimensions.space15, right: Dimensions.space15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45, width: 45,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(MyImages.userProfile), fit: BoxFit.fill)
            ),
          ),
          const SizedBox(height: Dimensions.space15),

          Text(
            "William Anne",
            style: regularLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: Dimensions.space5),
          Text(
            "williamanne123@gmail.com",
            style: regularSmall.copyWith(color: MyColor.contentTextColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

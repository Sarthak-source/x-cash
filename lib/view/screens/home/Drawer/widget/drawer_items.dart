import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {

  int selectedItems = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          items(MyImages.myProfile, "My Profile", 0),

          const SizedBox(height: Dimensions.space15),

          items(MyImages.changePassword, "Change Password", 1),

          const SizedBox(height: Dimensions.space15),

          items(MyImages.termServices, "Terms of Services", 2),

          const SizedBox(height: Dimensions.space15),

          items(MyImages.logout, "Logout", 3)
        ],
      ),
    );
  }

  Widget items(String itemImage, String itemName, int itemIndex){
    return GestureDetector(
      onTap: () async{
        setState(() {
          selectedItems = itemIndex;
        });

        await Future.delayed(const Duration(milliseconds: 400));

        dashBoardScreensRoute(itemIndex);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimensions.space15),
        decoration: BoxDecoration(
          color: itemIndex == selectedItems ? MyColor.primaryColor100 : MyColor.colorWhite,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            Container(
              height: 30, width: 30,
              padding: const EdgeInsets.all(Dimensions.space5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: itemIndex == selectedItems ? MyColor.colorWhite : MyColor.primaryColor100,
                shape: BoxShape.circle
              ),
              child: Image.asset(itemImage, color: itemIndex == selectedItems ? MyColor.primaryColor : MyColor.colorBlack, height: 15, width: 15),
            ),

            const SizedBox(width: Dimensions.space15),

            Text(
              itemName,
              style: interRegularDefault.copyWith(color: itemIndex == selectedItems ? MyColor.primaryColor : MyColor.colorBlack, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  void dashBoardScreensRoute(int index) {

    switch(index){
      case 0:
        Get.toNamed(RouteHelper.profileScreen);
        break;
      case 1:
        Get.toNamed(RouteHelper.changePasswordScreen);
        break;
      case 2:
        Get.toNamed(RouteHelper.termsServiceScreen);
        break;
      case 3:
        Get.offAndToNamed(RouteHelper.loginScreen);
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          elevation: 0,
          backgroundColor: MyColor.primaryColor,
          title: "Profile",
          textColor: MyColor.colorWhite,
          showBackIcon: true,
          iconColor: MyColor.colorWhite,
          changeRoute: () => Get.back(),
        ),
      ),
    );
  }
}

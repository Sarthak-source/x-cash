import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';

class MyVoucherScreen extends StatefulWidget {
  const MyVoucherScreen({Key? key}) : super(key: key);

  @override
  State<MyVoucherScreen> createState() => _MyVoucherScreenState();
}

class _MyVoucherScreenState extends State<MyVoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: MyStrings.myVoucher,
          changeRoute: () => Get.back(),
        ),
      ),
    );
  }
}

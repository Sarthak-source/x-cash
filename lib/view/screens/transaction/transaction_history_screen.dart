import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          elevation: 0,
          showBackIcon: true,
          title: "${MyStrings.transaction} History",
          backgroundColor: MyColor.colorWhite,
          actions: [
            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(
                  color: MyColor.transparentColor,
                  shape: BoxShape.circle
                ),
                child: Image.asset(MyImages.search, color: MyColor.primarySubTextColor, height: 20, width: 20),
              ),
            ),

            const SizedBox(width: Dimensions.space15),

            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(
                    color: MyColor.transparentColor,
                    shape: BoxShape.circle
                ),
                child: Image.asset(MyImages.filter, color: MyColor.primarySubTextColor, height: 20, width: 20),
              ),
            ),

            const SizedBox(width: Dimensions.space15),
          ],
          changeRoute: () => Get.back(),
        ),
      ),
    );
  }
}

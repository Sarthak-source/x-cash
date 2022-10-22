import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/screens/request-money/request_money/request_money.dart';

class RequestToMeScreen extends StatefulWidget {
  const RequestToMeScreen({Key? key}) : super(key: key);

  @override
  State<RequestToMeScreen> createState() => _RequestToMeScreenState();
}

class _RequestToMeScreenState extends State<RequestToMeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: "Money Request",
          backgroundColor: MyColor.colorWhite,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Dimensions.space15),
              child: GestureDetector(
                onTap: (){
                  CustomBottomSheet(
                    child: const RequestMoney()
                  ).customBottomSheet(context);
                },
                child: Container(
                  height: 25, width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColor.colorWhite, border: Border.all(color: MyColor.primaryColor, width: 1.5),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.add, color: MyColor.primaryColor, size: 15),
                ),
              ),
            )
          ],
          changeRoute: () => Get.back(),
        ),
      ),
    );
  }
}

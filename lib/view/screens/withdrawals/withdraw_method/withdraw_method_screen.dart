import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';

class WithdrawMethodScreen extends StatefulWidget {
  const WithdrawMethodScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMethodScreen> createState() => _WithdrawMethodScreenState();
}

class _WithdrawMethodScreenState extends State<WithdrawMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.getScreenBgColor(),
        appBar: AppBar(
        elevation: 0,
        title: Text(MyStrings.withdrawMethod, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
        backgroundColor: MyColor.getAppBarColor(),
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.space15),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.addWithdrawMethodScreen);
              },
              child: Container(
                height: 30, width: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: MyColor.colorWhite, shape: BoxShape.circle),
                child: Icon(Icons.add, color: MyColor.getPrimaryColor(), size: 15),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}

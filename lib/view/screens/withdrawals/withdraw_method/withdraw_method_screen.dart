import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
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
        appBar: CustomAppBar(
          title: MyStrings.withdrawMethod,
          bgColor: MyColor.getAppBarColor(),
        ),
      ),
    );
  }
}

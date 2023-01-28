import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_method/widget/withdraw_method_form.dart';

class WithdrawMethodScreen extends StatelessWidget {
  const WithdrawMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.getScreenBgColor(),
        appBar: CustomAppBar(
          title: MyStrings.withdrawMethod,
          bgColor: MyColor.getAppBarColor(),
        ),
        body: SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WithdrawMethodForm()
            ],
          ),
        ),
      ),
    );
  }
}

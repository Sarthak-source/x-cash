import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_method_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_method_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_method/widget/withdraw_method_form.dart';

class WithdrawMethodScreen extends StatefulWidget {
  const WithdrawMethodScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMethodScreen> createState() => _WithdrawMethodScreenState();
}

class _WithdrawMethodScreenState extends State<WithdrawMethodScreen> {
  
  
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawMethodRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawMethodController(withdrawMethodRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });

  }
  
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

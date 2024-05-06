import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/voucher/create_voucher_controller.dart';
import 'package:xcash_app/data/repo/voucher/create_voucher_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/widget/create_voucher_form.dart';

class CreateVoucherScreen extends StatefulWidget {
  const CreateVoucherScreen({Key? key}) : super(key: key);

  @override
  State<CreateVoucherScreen> createState() => _CreateVoucherScreenState();
}

class _CreateVoucherScreenState extends State<CreateVoucherScreen> {
  
  @override
  void initState() {
    
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(CreateVoucherRepo(apiClient: Get.find()));
    final controller = Get.put(CreateVoucherController(createVoucherRepo: Get.find()));
    
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      controller.loadData();
    });
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVoucherController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            isShowBackBtn: true,
            title: MyStrings.createVoucher.tr,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : const SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: CreateVoucherForm(),
          ),
        ),
      ),
    );
  }
}
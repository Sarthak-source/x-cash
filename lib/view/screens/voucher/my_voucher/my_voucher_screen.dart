import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/voucher_list_controller.dart';
import 'package:xcash_app/data/repo/voucher/voucher_list_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/create_voucher.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/middle_tab_buttons.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/voucher_not_used.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/voucher_used.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';

class MyVoucherScreen extends StatefulWidget {
  const MyVoucherScreen({Key? key}) : super(key: key);

  @override
  State<MyVoucherScreen> createState() => _MyVoucherScreenState();
}

class _MyVoucherScreenState extends State<MyVoucherScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (Get.find<VoucherListController>().hasNext()) {
        Get.find<VoucherListController>().loadData();
      }
    }
  }

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(VoucherListRepo(apiClient: Get.find()));
    final controller = Get.put(VoucherListController(voucherListRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoucherListController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(MyStrings.myVoucher, style: regularLarge.copyWith(color: MyColor.getAppBarContentColor())),
            backgroundColor: MyColor.getAppBarColor(),
            actions: [
              IconButton(
                onPressed: (){
                  CustomBottomSheet(
                      child: const RedeemVoucher()
                  ).customBottomSheet(context);
                },
                icon: Icon(Icons.card_giftcard, color: MyColor.getAppBarContentColor(), size: 20),
              ),
              IconButton(
                onPressed: (){
                  CustomBottomSheet(
                      child: const CreateVoucher()
                  ).customBottomSheet(context);
                },
                icon: Icon(Icons.add_circle_outline_rounded, color: MyColor.getAppBarContentColor(), size: 20),
              ),
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      MiddleTabButtons(buttonName: MyStrings.notUsed, activeButton: controller.activeTab),
                      MiddleTabButtons(buttonName: MyStrings.used, activeButton: !controller.activeTab),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              controller.activeTab ? const Expanded(
                  child: VoucherNotUsed()
              ) : const Expanded(
                  child: VoucherUsed()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

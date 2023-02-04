import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/voucher_list_controller.dart';
import 'package:xcash_app/data/repo/voucher/voucher_list_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/voucher_list_card.dart';

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
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
            ),
            title: Text(MyStrings.myVoucher.tr, style: regularLarge.copyWith(color: MyColor.getAppBarContentColor())),
            backgroundColor: MyColor.getAppBarColor(),
            actions: [
              ActionButtonIconWidget(
                  pressed: () => Get.toNamed(RouteHelper.createVoucherScreen),
                  icon: Icons.add
              )
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : Padding(
            padding: Dimensions.screenPaddingHV,
            child: Column(
              children: [
                Expanded(
                    child: controller.voucherList.isEmpty ? const NoDataOrInternetScreen() : SizedBox(
                      height: MediaQuery.of(context).size.height,
                        child: const VoucherListCard()
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

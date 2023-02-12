import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_money_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/no_data.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_bottom_sheet.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_card.dart';

class WithdrawMoneyScreen extends StatefulWidget {
  const WithdrawMoneyScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMoneyScreen> createState() => _WithdrawMoneyScreenState();
}

class _WithdrawMoneyScreenState extends State<WithdrawMoneyScreen> {

  final ScrollController scrollController = ScrollController();
  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(Get.find<WithdrawMoneyController>().hasNext()){
        Get.find<WithdrawMoneyController>().loadData();
      }
    }
  }

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawMoneyController(withdrawMoneyRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(MyStrings.withdrawMoney.tr, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
            backgroundColor: MyColor.getAppBarColor(),
            leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20)),
            actions: [
              ActionButtonIconWidget(
                  isImage: true,
                  pressed: () => Get.toNamed(RouteHelper.withdrawMethodScreen),
                  imageSrc: MyImages.withdrawMethod
              )
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: Dimensions.screenPaddingHV,
            child: controller.withdrawMoneyList.isEmpty ? const Center(
              child: NoDataWidget(),
            ) : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.withdrawMoneyList.length + 1,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10 + 2),
                itemBuilder: (context, index){
                  if(controller.withdrawMoneyList.length == index){
                    return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                  }
                  return WithdrawMoneyCard(
                    index: index,
                    press: () => CustomBottomSheet(child: WithdrawMoneyBottomSheet(index: index)).customBottomSheet(context)
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}

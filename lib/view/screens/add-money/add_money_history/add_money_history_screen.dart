import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/data/repo/add_money/add_money_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/screens/add-money/add_money_history/widget/add_money_history_card.dart';
import 'package:xcash_app/view/screens/add-money/add_money_history/widget/add_money_history_filter_widget.dart';

class AddMoneyHistoryScreen extends StatefulWidget {
  const AddMoneyHistoryScreen({Key? key}) : super(key: key);

  @override
  State<AddMoneyHistoryScreen> createState() => _AddMoneyHistoryScreenState();
}

class _AddMoneyHistoryScreenState extends State<AddMoneyHistoryScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(Get.find<AddMoneyHistoryController>().hasNext()){
        Get.find<AddMoneyHistoryController>().loadPaginationData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(AddMoneyHistoryRepo(apiClient: Get.find()));
    final controller = Get.put(AddMoneyHistoryController(addMoneyHistoryRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialSelectedValue();
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
    return GetBuilder<AddMoneyHistoryController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.bottomNavBar),
              child: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
            ),
            title: Text(MyStrings.addMoneyHistory, style: regularDefault.copyWith(color: MyColor.appBarContentColor)),
            backgroundColor: MyColor.getAppBarColor(),
            actions: [
              ActionButtonIconWidget(
                  pressed: () => controller.changeSearchStatus(),
                  icon: controller.isSearch ? Icons.clear : Icons.search,
              ),
              ActionButtonIconWidget(
                pressed: () => Get.toNamed(RouteHelper.addMoneyScreen),
                icon: Icons.add,
              ),
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : Padding(
            padding: Dimensions.screenPaddingHV,
            child: Column(
              children: [
                Visibility(
                  visible: controller.isSearch,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AddMoneyHistoryFilterWidget(),
                      SizedBox(height: Dimensions.space20),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.depositList.isEmpty && controller.filterLoading == false ? const Center(
                    child: NoDataOrInternetScreen(),
                  ) : controller.filterLoading ? const CustomLoader() : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        itemCount: controller.depositList.length + 1,
                        separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                        itemBuilder: (context, index) {
                          if(controller.depositList.length == index){
                            return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                          }
                          return AddMoneyHistoryCard(index: index);
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

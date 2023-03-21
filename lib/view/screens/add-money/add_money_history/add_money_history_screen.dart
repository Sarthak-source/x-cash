import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';
import 'package:xcash_app/data/repo/add_money/add_money_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/no_data.dart';
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
          appBar: CustomAppBar(
            title:MyStrings.addMoneyHistory,
            isShowActionBtn: true,
            isShowBackBtn: true,
            actionIcon: controller.isSearch ? Icons.clear : Icons.search,
            isActionImage: false,
            actionPress: (){
              controller.changeSearchStatus();
            },
          ),
          body: controller.isLoading ? const CustomLoader() : Padding(
            padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Visibility(
                    visible: controller.isSearch,
                    child: const AddMoneyHistoryFilterWidget(),
                  ),
                  controller.depositList.isEmpty && controller.filterLoading == false ? const Center(
                    child: NoDataWidget(),
                  ) : controller.filterLoading ? const CustomLoader() : Expanded(
                    flex: 0,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

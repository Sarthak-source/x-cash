import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/data/repo/request_money/my_request_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/middle_tab_buttons.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/my_request_list_item.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/to_me_list_item.dart';

class RequestToMeScreen extends StatefulWidget {
  const RequestToMeScreen({Key? key}) : super(key: key);

  @override
  State<RequestToMeScreen> createState() => _RequestToMeScreenState();
}

class _RequestToMeScreenState extends State<RequestToMeScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (Get.find<MyRequestHistoryController>().hasNext()) {
        Get.find<MyRequestHistoryController>().loadHistoryData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(MyRequestHistoryRepo(apiClient: Get.find()));
    Get.put(MyRequestHistoryController(myRequestHistoryRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<MyRequestHistoryController>().initialStateData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: CustomAppBar(
            title: MyStrings.moneyRequestToMe.tr,
            isShowBackBtn: true,
            bgColor: MyColor.getAppBarColor(),
          ),
          body:  Column(
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
                      MiddleTabButtons(buttonName: MyStrings.myRequests.tr, activeButton: controller.isMyRequest,press: (){
                        if(!controller.isMyRequest){
                          controller.changeTabState(true);
                        }
                      },),
                      MiddleTabButtons(buttonName: MyStrings.toMe.tr, activeButton: !controller.isMyRequest,press: (){
                        if(controller.isMyRequest){
                          controller.changeTabState(false);
                        }
                      },),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.space20),
              Expanded(
                child: controller.isLoading ? const CustomLoader() : controller.myRequestList.isEmpty ? const NoDataOrInternetScreen() : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.myRequestList.length + 1,
                        separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                        itemBuilder: (context, index){
                          if(controller.myRequestList.length == index){
                            return controller.hasNext() ? Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(5),
                                child: const CustomLoader()
                            ) : const SizedBox();
                          }
                          return controller.isMyRequest ? MyRequestListItem(index: index): ToMeListItem(index: index);
                        },
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

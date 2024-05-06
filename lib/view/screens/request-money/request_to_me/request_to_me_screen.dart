import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/data/repo/request_money/my_request_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/middle_tab_buttons.dart';
import 'widget/my_request_tab_widget.dart';
import 'widget/to_me_tab_widget.dart';

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
        final controller = Get.find<MyRequestHistoryController>();
          controller.loadToMeHistoryData();
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
      Get.find<MyRequestHistoryController>().getOtpData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.screenBgColor,
            appBar: CustomAppBar(
              title: MyStrings.moneyRequests.tr,
              isShowBackBtn: true,
              bgColor: MyColor.getAppBarColor(),
            ),
            body:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
                  child: Container(
                    padding: const EdgeInsets.all(Dimensions.space8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: MyColor.colorWhite,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: MyUtils.getCardShadow()
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
                controller.isMyRequest?
                const MyRequestTabWidget():
                const RequestToMeTabWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/no_data.dart';

import 'to_me_list_item.dart';

class RequestToMeTabWidget extends StatefulWidget {
  const RequestToMeTabWidget({Key? key}) : super(key: key);

  @override
  State<RequestToMeTabWidget> createState() => _RequestToMeTabWidgetState();
}

class _RequestToMeTabWidgetState extends State<RequestToMeTabWidget> {

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(scrollListener);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(builder: (controller){
      return  Expanded(
          child: controller.isLoading || (controller.toMeRequestPage ==0 && controller.isToMeRequestLoading) ? const CustomLoader() : controller.requestToMeList.isEmpty ? const Center(child: NoDataWidget()) : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
              child: ListView.separated(
                shrinkWrap: true,
                controller: scrollController,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.requestToMeList.length+1,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index){

                  if(controller.requestToMeList.length == index){
                    return controller.hasNext() ? Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(5),
                        child: const CustomLoader()
                    ) : const SizedBox();
                  }
                  return  ToMeListItem(index: index);
                },
              ),
            ),
          )
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/no_data.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/my_request_list_item.dart';

import 'to_me_list_item.dart';

class MyRequestTabWidget extends StatelessWidget {
  final ScrollController scrollController;
  const MyRequestTabWidget({Key? key,required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(builder: (controller){
      return  Expanded(
          child: controller.isLoading ? const CustomLoader() : controller.myRequestList.isEmpty ? const Center(child: NoDataWidget()) : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
              child: ListView.separated(
                shrinkWrap: true,
                controller: scrollController,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.myRequestList.length+1,
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
                  return  MyRequestListItem(index: index);
                },
              ),
            ),
          )
      );
    });
  }
}

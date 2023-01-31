import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class RequestRejectAlertDialog extends StatelessWidget {

  final int index;
  const RequestRejectAlertDialog({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(MyImages.reject, height: 50, width: 50),
          const SizedBox(height: Dimensions.space10),
          Text(
            MyStrings.areYouSureReject,
            style: regularDefault.copyWith(color: MyColor.getPrimaryColor(), fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const CustomDivider(space: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RoundedButton(
                    color: MyColor.colorBlack,
                    text: MyStrings.cancel,
                    press: (){
                      Get.back();
                    }
                ),
              ),
              const SizedBox(width: Dimensions.space15),
              Expanded(
                child: controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    color: MyColor.colorRed,
                    text: MyStrings.reject,
                    press: (){
                      controller.requestReject(controller.myRequestList[index].id.toString());
                    }
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

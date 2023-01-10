import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/row_icon_text_widget.dart';

class ActivityScreen extends StatelessWidget {

  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BottomSheetBar(),
        const SizedBox(height: Dimensions.space15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowIconTextWidget(
                isSvgPicture: true,
                image: MyImages.transaction,
                text: MyStrings.transaction,
                onPressed: (){
                  Get.toNamed(RouteHelper.transactionHistoryScreen);
                },
            ),

            const CustomDivider(height: Dimensions.space15),

            RowIconTextWidget(
                isSvgPicture: true,
                image: MyImages.requestMe,
                text: MyStrings.requestToMe,
                onPressed: (){
                  Get.toNamed(RouteHelper.requestToMeScreen);
                },
            ),

            const CustomDivider(height: Dimensions.space15),

            RowIconTextWidget(
                isSvgPicture: true,
                image: MyImages.addMoneyHistory,
                text: MyStrings.addMoneyHistory,
                onPressed: (){
                  Get.toNamed(RouteHelper.addMoneyHistoryScreen);
                },
            ),

            const CustomDivider(height: Dimensions.space15),

            RowIconTextWidget(
              isSvgPicture: true,
              image: MyImages.myVoucher,
              text: MyStrings.myVoucher,
              onPressed: (){
                Get.toNamed(RouteHelper.myVoucherScreen);
              },
            ),

            const CustomDivider(height: Dimensions.space15),

            RowIconTextWidget(
                isSvgPicture: true,
                image: MyImages.withdrawHistory,
                text: MyStrings.withdrawHistory,
                onPressed: (){
                  Get.toNamed(RouteHelper.withdrawHistoryScreen);
                },
            ),
          ],
        )
      ],
    );
  }
}

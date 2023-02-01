import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/request_money/request_money/request_money_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/row_widget/bottom_sheet_row.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class RequestMoneyBottomSheet extends StatelessWidget {
  const RequestMoneyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestMoneyController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.paymentPreview),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          BottomSheetRow(
            header: MyStrings.totalAmount,
            body: "${controller.amountController.text} ${controller.currency}",
          ),
          const SizedBox(height: Dimensions.space10),
          BottomSheetRow(
            header: MyStrings.totalCharge,
            body: controller.charge,
          ),
          const SizedBox(height: Dimensions.space10),
          BottomSheetRow(
            header: MyStrings.payable,
            body: controller.payableText,
          ),
          const SizedBox(height: Dimensions.space20),
          controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
            text: MyStrings.confirm,
            press: (){
                controller.submitRequest();
              }
          )
        ],
      ),
    );
  }
}

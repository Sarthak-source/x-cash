import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_money_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class WithdrawMoneyBottomSheet extends StatelessWidget {
  final int index;
  const WithdrawMoneyBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMoneyController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.withdrawMoney),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(space: Dimensions.space15),
          CustomAmountTextField(
              labelText: MyStrings.amount.tr,
              hintText: MyStrings.amountHint.tr,
              currency: controller.withdrawMoneyList[index].currency?.currencyCode ?? "",
              controller: controller.amountController,
              onChanged: (value){}
          ),
          const SizedBox(height: Dimensions.space30),
          controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
            text: MyStrings.submit,
            press: (){
              controller.submitData(
                  methodName: controller.withdrawMoneyList[index].withdrawMethod?.name ?? "",
                  methodId: controller.withdrawMoneyList[index].withdrawMethod?.id.toString() ?? "",
                  userMethodId: controller.withdrawMoneyList[index].id.toString()
              );
            },
          )
        ],
      ),
    );
  }
}

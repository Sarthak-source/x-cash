import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_money_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class WithdrawMoneyBottomSheet{

  static void bottomSheet(BuildContext context, {required int index}){

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: MyColor.transparentColor,
        context: context,
        builder: (BuildContext context) => GetBuilder<WithdrawMoneyController>(
          builder: (controller) => SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15))
              ),
              child: Column(
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
                      labelText: MyStrings.amount,
                      hintText: MyStrings.amountHint,
                      currency: controller.withdrawMoneyList[index].currency?.currencyCode ?? "",
                      controller: controller.amountController,
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space25),
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
            ),
          ),
        )
    );
  }
}
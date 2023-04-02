import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/exchange/exchange_money_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/row_widget/bottom_sheet_row.dart';

class ExchangePreviewBottomSheet extends StatelessWidget {
  const ExchangePreviewBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeMoneyController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetHeaderRow(header: MyStrings.exchangeCalculation),
          const SizedBox(height: Dimensions.space15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.space12,vertical: Dimensions.space15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              border: Border.all(color: MyColor.borderColor)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetRow(
                  header: controller.fromWalletMethod?.currency?.currencyCode??'',
                  body: '${controller.fromWalletMethod?.currency?.currencySymbol}${controller.amount}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Expanded(child: CustomDivider(space: Dimensions.space15)),
                    const SizedBox(width: 20,),
                    Text('To'.tr,style: regularDefault,),
                    const SizedBox(width: 20,),
                    const Expanded(child: CustomDivider(space: Dimensions.space15)),
                  ],
                ),
                BottomSheetRow(
                  header: controller.toWalletMethod?.currency?.currencyCode??'',
                  body: '${controller.toWalletMethod?.currency?.currencySymbol}${controller.exchangeAmount}',
                ),
              ],
            ),
          ),

          const SizedBox(height: Dimensions.space30),
          controller.isSubmitLoading ? const RoundedLoadingBtn() : RoundedButton(
            text: MyStrings.confirm,
            press: (){
                controller.submitExchangeMoney();
              }
          )
        ],
      ),
    );
  }
}

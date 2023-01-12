import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/exchange/exchange_money_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class ExchangeMoneyBottomSheet extends StatelessWidget {
  const ExchangeMoneyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExchangeMoneyController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.exchangeMoney),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: Dimensions.screenPaddingHV,
            decoration: BoxDecoration(
              color: MyColor.getTransparentColor(),
              borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              border: Border.all(color: MyColor.borderColor, width: 0.5)
            ),
            child: Row(
              children: [
                Text(
                  "${MyStrings.exchangeCalculation}:",
                  style: regularDefault.copyWith(color: MyColor.colorBlack),
                ),
                const SizedBox(width: Dimensions.space10),
                Text(
                  "${controller.exchangeAmount} ${controller.toWalletMethod?.currencyCode ?? ""}",
                  style: regularDefault.copyWith(color: MyColor.getPrimaryColor()),
                )
              ],
            ),
          ),
          const SizedBox(height: Dimensions.space25),
          controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
            press: (){
              controller.submitExchangeMoney();
            },
            text: MyStrings.confirm,
          )
        ],
      ),
    );
  }
}

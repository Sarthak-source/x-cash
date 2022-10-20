import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_form.dart';

class WithdrawMoneyBottomSheet{

  static void bottomSheet(BuildContext context, String bankImage, String bankName, String amount, String charge, String rate){

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: MyColor.transparentColor,
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
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
                    BottomSheetHeaderText(text: MyStrings.requestDetails),
                    BottomSheetCloseButton()
                  ],
                ),

                const CustomDivider(),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(Dimensions.space15),
                  decoration: BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: MyColor.colorGrey.withOpacity(0.6), width: 0.5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60, width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(bankImage),
                                fit: BoxFit.cover
                            )
                        ),
                      ),

                      const SizedBox(width: Dimensions.space15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(bankName, style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                          const SizedBox(height: Dimensions.space5),

                          Text(amount, style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),

                          const SizedBox(height: Dimensions.space10),
                          Text("Charge : $charge USD + $rate%", style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: Dimensions.space30),

                const WithdrawMoneyForm()
              ],
            ),
          ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_label_text.dart';

class WithdrawHistoryBottomSheet{

  static void bottomSheet(BuildContext context, String trxNo, String status, String amount, String date, String time){

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: MyColor.transparentColor,
        context: context,
        builder: (context) => SingleChildScrollView(
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BottomSheetHeaderText(text: trxNo),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            Text("${MyStrings.status}: ", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500)),
                            Text(status, style: interRegularSmall.copyWith(color: getTextColor(status),fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                    const BottomSheetCloseButton()
                  ],
                ),

                const CustomDivider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BottomSheetLabelText(text: MyStrings.amount),
                          const SizedBox(height: Dimensions.space5),
                          Text("$amount USD", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BottomSheetLabelText(text: MyStrings.date),
                          const SizedBox(height: Dimensions.space5),
                          Text("$date - $time", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.space20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BottomSheetLabelText(text: "Withdraw method"),
                          const SizedBox(height: Dimensions.space5),
                          Text("xCash", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BottomSheetLabelText(text: MyStrings.charge),
                          const SizedBox(height: Dimensions.space5),
                          Text("0.50 USD", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.space20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BottomSheetLabelText(text: "Receivable"),
                          const SizedBox(height: Dimensions.space5),
                          Text("800.50 USD", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  static Color getTextColor(String status){
    return status == "Pending" ? MyColor.colorOrange : MyColor.colorGreen;
  }
}
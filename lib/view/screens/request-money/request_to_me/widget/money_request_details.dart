import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_label_text.dart';

class MoneyRequestDetails{

  static void bottomSheet(BuildContext context){

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
                children: const [
                  BottomSheetHeaderText(text: "demouser demouser"),
                  BottomSheetCloseButton()
                ],
              ),

              const CustomDivider(height: Dimensions.space15),

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
                        Text("400.00 USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        Text("Sep 12, 2022 - 6:00 am", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        const BottomSheetLabelText(text: MyStrings.walletCurrency),
                        const SizedBox(height: Dimensions.space5),
                        Text("USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetLabelText(text: MyStrings.note),
                        const SizedBox(height: Dimensions.space5),
                        Text("Wll uncover many web sites still", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
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
                        const BottomSheetLabelText(text: MyStrings.remainingBalance),
                        const SizedBox(height: Dimensions.space5),
                        Text("3,481,070,153.00 USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
}
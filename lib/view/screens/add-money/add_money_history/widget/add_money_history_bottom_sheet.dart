import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_label_text.dart';

class AddMoneyHistoryBottomSheet{

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
                          Text("${MyStrings.status}: ", style: regularSmall.copyWith(fontWeight: FontWeight.w500)),
                          Text(status, style: regularSmall.copyWith(color: getTextColor(status),fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 30, width: 30,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(Dimensions.space5),
                      decoration: const BoxDecoration(color: MyColor.screenBgColor, shape: BoxShape.circle),
                      child: const Icon(Icons.clear, color: MyColor.colorBlack, size: 15),
                    ),
                  )
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
                        Text("$amount USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        Text("$date - $time", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        const BottomSheetLabelText(text: MyStrings.gateWay),
                        const SizedBox(height: Dimensions.space5),
                        Text("Mobile Money", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        Text("0.50 USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        const BottomSheetLabelText(text: MyStrings.payableAmount),
                        const SizedBox(height: Dimensions.space5),
                        Text("800.50 USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetLabelText(text: MyStrings.payableAfterCharge),
                        const SizedBox(height: Dimensions.space5),
                        Text("800.50 USD", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
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
                        const BottomSheetLabelText(text: MyStrings.sendFromNumber),
                        const SizedBox(height: Dimensions.space5),
                        Text("56385385", style: regularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetLabelText(text: MyStrings.screenShot),
                        const SizedBox(height: Dimensions.space5),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: [
                                  const Icon(Icons.attach_file_sharp, color: MyColor.primaryColor, size: 16),
                                  const SizedBox(width: Dimensions.space5),
                                  Text("Attached File", style: regularDefault.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w500))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: Dimensions.space20),
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
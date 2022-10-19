import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_label_text.dart';

class MyInvoiceBottomSheet{
  static void bottomSheet(BuildContext context, String name, String status, String amount, String date, String time){

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
                      BottomSheetHeaderText(text: "${MyStrings.invoice} to $name"),
                      const SizedBox(height: Dimensions.space5),
                      Row(
                        children: [
                          Text("${MyStrings.status}: ", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500)),
                          Text(status, style: interRegularSmall.copyWith(color: getTextColor(status),fontWeight: FontWeight.w500)),
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
                      decoration: const BoxDecoration(color: MyColor.primaryColor100, shape: BoxShape.circle),
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
                        Text("$amount USD", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BottomSheetLabelText(text: MyStrings.createdDate),
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
                        const BottomSheetLabelText(text: MyStrings.paymentStatus),
                        const SizedBox(height: Dimensions.space5),
                        Text("Paid", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.space20),

              CustomAnimatedButton(
                  onTap: (){}, // add web view
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: MyColor.primaryColor,
                  child: Text(MyStrings.continueDownload, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
      )
    );
  }

  static Color getTextColor(String status){
    return status == "Discarded" ? MyColor.colorRed : MyColor.colorGreen;
  }
}
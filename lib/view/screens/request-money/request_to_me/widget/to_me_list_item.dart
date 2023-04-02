import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/data/controller/request_money/request_to_me/my_request_history_controller.dart';
import 'package:xcash_app/view/components/alert-dialog/custom_alert_dialog.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/card_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/column_widget/card_column.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/request_reject_alert_dialog.dart';
import '../../../../../core/utils/my_color.dart';

class ToMeListItem extends StatelessWidget {
  final int index;

  const ToMeListItem({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius),boxShadow:  MyUtils.getCardShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                  header: MyStrings.requestFrom,
                  body: "${controller.requestToMeList[index].sender?.firstname ?? ""} ${controller.requestToMeList[index].sender?.lastname ?? ""}"
                ),
                CardColumn(
                    header: MyStrings.date,
                    body: DateConverter.isoStringToLocalDateOnly(controller.requestToMeList[index].createdAt ?? ""),
                    alignmentEnd: true
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardColumn(
                  header: MyStrings.amount,
                  body: "${Converter.formatNumber(controller.requestToMeList[index].requestAmount ?? "")} "
                    "${controller.requestToMeList[index].currency?.currencyCode ?? ""}"
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CardButton(
                      isText: false,
                      bgColor: MyColor.colorRed,
                      icon: Icons.highlight_off,
                      press: (){
                        CustomAlertDialog(
                            isHorizontalPadding: true,
                            child: RequestRejectAlertDialog(index: index)
                        ).customAlertDialog(context);
                      },
                    ),
                    const SizedBox(width: Dimensions.space10),
                    CardButton(
                      isText: false,
                      bgColor: MyColor.colorGreen,
                      icon: Icons.done_all,
                      press: () => CustomBottomSheet(
                        child: GetBuilder<MyRequestHistoryController>(
                          builder: (requestController) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  BottomSheetHeaderText(text: MyStrings.sureToConfirm.tr),
                                  const BottomSheetCloseButton()
                                ],
                              ),
                              const SizedBox(height: Dimensions.space20),
                              Text(
                                "${Converter.formatNumber(requestController.requestToMeList[index].requestAmount ?? "")} "
                                    "${requestController.requestToMeList[index].currency?.currencyCode ?? ""} "
                                    "${MyStrings.willBeReduced} ${requestController.requestToMeList[index].currency?.currencyCode ?? ""} ${MyStrings.wallet.toLowerCase()}.",
                                textAlign: TextAlign.center,
                                style: regularLarge.copyWith(color: MyColor.colorBlack.withOpacity(0.5)),
                              ),
                              Visibility(
                                visible:controller.otpTypeList.length>1,
                                child: Column(
                                children: [
                                  const SizedBox(height: Dimensions.space15),
                                  CustomDropDownTextField(
                                    labelText: MyStrings.selectOtp.tr,
                                    selectedValue: requestController.selectedOtp,
                                    onChanged: (value) => requestController.setOtpMethod(value),
                                    items: requestController.otpTypeList.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                            value.toString().toTitleCase().tr,
                                            style: regularDefault
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )),
                              const SizedBox(height: Dimensions.space20),
                              requestController.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                                  text: MyStrings.confirm,
                                  press: (){
                                    requestController.requestAccept(index,requestController.requestToMeList[index].id.toString(), requestController.selectedOtp);
                                  }
                              ),
                            ],
                          ),
                        )
                      ).customBottomSheet(context)
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}













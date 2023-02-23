import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';

showTrxBottomSheet(List<String>? list, int callFrom, {required BuildContext context}){

  if (list != null && list.isNotEmpty) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                decoration: const BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.colorGrey.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        BottomSheetCloseButton()
                      ],
                    ),
                    const SizedBox(height: Dimensions.space15),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                String selectedValue = list[index];
                                final controller= Get.find<TransactionHistoryController>();
                                if(callFrom == 1){
                                  controller.setSelectedTransactionType(selectedValue);
                                  controller.filterData();
                                }
                                else if(callFrom == 2){
                                  controller.setSelectedOperationType(selectedValue);
                                  controller.filterData();
                                }
                                else if(callFrom == 3){
                                  controller.setSelectedHistoryFrom(selectedValue);
                                  controller.filterData();
                                }
                                else if(callFrom == 4){
                                  controller.setSelectedWalletCurrency(selectedValue);
                                  controller.filterData();
                                }
                                Navigator.pop(context);

                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(Dimensions.space15),
                                margin: const EdgeInsets.only(top: Dimensions.space5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                    border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                ),
                                child: Text(
                                  ' ${callFrom == 2 ? Converter.replaceUnderscoreWithSpace(list[index].capitalizeFirst??''):list[index]}',
                                  style: regularDefault,
                                ),
                              ),
                            );
                        })
                  ],
                )
            ),
          );
        }
    );
  }
}
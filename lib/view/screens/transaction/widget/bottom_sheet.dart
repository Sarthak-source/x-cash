import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

showTrxBottomSheet(List<String>? list, int callFrom, {required BuildContext context}){

  if (list != null && list.isNotEmpty) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {

          String header = '';
          if(callFrom == 1){
            header = MyStrings.trxType;
          }
          else if(callFrom == 2){
            header = MyStrings.operationType;
          }
          else if(callFrom == 3){
            header = MyStrings.historyFrom;
          }
          else if(callFrom == 4){
            header = MyStrings.walletCurrency;
          }
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 8),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                decoration: const BoxDecoration(
                    color: Color(0xFFF7F8FC),//MyColor.colorWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BottomSheetHeaderRow(header: header,),
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
                              child: BottomSheetCard(
                                child: Text(
                                  '${callFrom == 2 ? Converter.replaceUnderscoreWithSpace(list[index].capitalizeFirst??''):
                                  callFrom == 3?MyUtils.getOperationTitle(list[index]):
                                  list[index]}',
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class CustomTransactionCard extends StatelessWidget {

  final String trxData;
  final String dateData;
  final String amountData;
  final String detailsText;
  final String postBalanceData;
  final int index;

  const CustomTransactionCard({

    Key? key,
    required this.index,
    required this.trxData,
    required this.dateData,
    required this.amountData,
    required this.postBalanceData,
    required this.detailsText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TransactionHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(5),

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
                    Text(MyStrings.trx, style: regularExtraSmall.copyWith(color: MyColor.labelTextColor)),
                    const SizedBox(height: 2),
                    Text(trxData, style: regularDefault.copyWith(color: MyColor.colorBlack))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.date, style: regularExtraSmall.copyWith(color: MyColor.labelTextColor)),
                    const SizedBox(height: 2),
                    Text(dateData, style: regularDefault.copyWith(color: MyColor.colorBlack))
                  ],
                )
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyStrings.amount, style: regularExtraSmall.copyWith(color: MyColor.labelTextColor)),
                    const SizedBox(height: 8),
                    Text(amountData, style: regularDefault.copyWith(color: changeTextColor(controller.transactionList[index].trxType.toString(), controller)))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.postBalance, style: regularExtraSmall.copyWith(color: MyColor.labelTextColor)),
                    const SizedBox(height: 8),
                    Text(postBalanceData, style: regularDefault.copyWith(color: MyColor.colorBlack))
                  ],
                )
              ],
            ),

            const CustomDivider(space: Dimensions.space15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.details, style: regularExtraSmall.copyWith(color: MyColor.labelTextColor)),
                const SizedBox(height: 8),
                Text(detailsText, style: regularDefault.copyWith(color: MyColor.colorBlack))
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Color changeTextColor(String trxType, TransactionHistoryController controller){
    trxType = controller.transactionList[index].trxType ?? "";
    return trxType == "+" ? MyColor.primaryColor : MyColor.colorRed;
  }
}

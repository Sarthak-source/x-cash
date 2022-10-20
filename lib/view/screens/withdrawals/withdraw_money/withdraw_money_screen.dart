import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_method/withdraw_method.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_bottom_sheet.dart';

class WithdrawMoneyScreen extends StatefulWidget {
  const WithdrawMoneyScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMoneyScreen> createState() => _WithdrawMoneyScreenState();
}

class _WithdrawMoneyScreenState extends State<WithdrawMoneyScreen> {

  List<Map<String, dynamic>> data = [
    {"bankImage" : MyImages.basic, "bankName" : MyStrings.basic, "amount" : MyStrings.min_max_Amount, "charge" : 2.00, "rate" : 1.00},
    {"bankImage" : MyImages.payoneer, "bankName" : MyStrings.payoneer, "amount" : MyStrings.min_max_Amount, "charge" : 2.00, "rate" : 1.00},
    {"bankImage" : MyImages.paypal, "bankName" : MyStrings.paypal, "amount" : MyStrings.min_max_Amount, "charge" : 2.00, "rate" : 1.00},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: MyStrings.withdrawMoney,
          backgroundColor: MyColor.colorWhite,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Dimensions.space15),
              child: GestureDetector(
                onTap: (){
                  CustomBottomSheet(
                    child: const WithdrawMethod()
                  ).customBottomSheet(context);
                },
                child: Container(
                  height: 25, width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColor.colorWhite, border: Border.all(color: MyColor.primarySubTextColor.withOpacity(0.8), width: 1.5),
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.add, color: MyColor.primarySubTextColor.withOpacity(0.8), size: 15),
                ),
              ),
            )
          ],
          changeRoute: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10 + 2),
            itemBuilder: (context, index) => CustomCard(
              paddingTop: Dimensions.space15,
              paddingBottom: Dimensions.space15,
              isPress: true,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    height: 60, width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(data[index]["bankImage"]),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  const SizedBox(width: Dimensions.space15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]["bankName"], style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(height: Dimensions.space5),

                      Text(data[index]["amount"], style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),

                      const SizedBox(height: Dimensions.space10),
                      Text("Charge : ${data[index]["charge"].toString()} USD + ${data[index]["rate"].toString()}%", style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),
                    ],
                  )
                ],
              ),
              onPressed: (){
                WithdrawMoneyBottomSheet.bottomSheet(
                    context,
                    "${data[index]["bankImage"]}",
                    "${data[index]["bankName"]}",
                    "${data[index]["amount"]}",
                    "${data[index]["charge"]}",
                    "${data[index]["rate"]}"
                );
              },
            )
          ),
        ),
      ),
    );
  }
}

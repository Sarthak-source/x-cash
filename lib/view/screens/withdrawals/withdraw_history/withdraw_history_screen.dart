import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/withdraw_history_bottom_sheet.dart';

class WithdrawHistoryScreen extends StatefulWidget {
  const WithdrawHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawHistoryScreen> createState() => _WithdrawHistoryScreenState();
}

class _WithdrawHistoryScreenState extends State<WithdrawHistoryScreen> {

  List<Map<String, String>> data = [
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "122.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "833.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "575.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "333.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "50.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "1250.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "10,000.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "950.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "775.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "150.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "175.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "250.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "423.85", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "450.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "665.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "880.00", "currency" : "USD",},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "122.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "422.00", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Completed", "amount" : "975.23", "currency" : "USD"},
    {"trxNo" : "#YPGNVRSARH41", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Pending", "amount" : "1165.12", "currency" : "USD"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: MyStrings.withdrawHistory,
          changeRoute: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
              itemBuilder: (context, index) => CustomCard(
                isPress: true,
                paddingLeft: Dimensions.space10, paddingRight: Dimensions.space10,
                paddingTop: Dimensions.space15, paddingBottom: Dimensions.space15,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${data[index]["trxNo"]}", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: Dimensions.space5 / 2, horizontal: Dimensions.space5),
                          decoration: BoxDecoration(
                              color: getBgColor("${data[index]['status']}"),
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: borderColor("${data[index]['status']}"), width: 0.5)
                          ),
                          child: Text(
                              "${data[index]['status']}",
                              textAlign: TextAlign.center,
                              style: interRegularExtraSmall.copyWith(
                                  color: getTextColor("${data[index]['status']}"),
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: Dimensions.space5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${data[index]["date"]} - ${data[index]["time"]}", style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),
                        Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(text: "${data[index]["amount"]}", style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                                TextSpan(text: " ${data[index]["currency"]}", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500))
                              ]
                          ),
                        )
                      ],
                    )
                  ],
                ),
                onPressed: (){
                  WithdrawHistoryBottomSheet.bottomSheet(
                      context,
                      "${data[index]["trxNo"]}",
                      "${data[index]["status"]}",
                      "${data[index]["amount"]}",
                      "${data[index]["date"]}",
                      "${data[index]["time"]}"
                  );
                },
              )
          ),
        ),
      ),
    );
  }

  Color getTextColor(String status){
    return status == "Pending" ? MyColor.colorOrange : MyColor.colorGreen;
  }

  Color getBgColor(String status){
    return status == "Pending" ? MyColor.colorOrange100 : MyColor.colorGreen100;
  }

  Color borderColor(String status){
    return status == "Pending" ? MyColor.colorOrange : MyColor.colorGreen;
  }
}

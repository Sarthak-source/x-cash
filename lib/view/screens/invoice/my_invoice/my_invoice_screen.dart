import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/widget/my_invoice_bottom_sheet.dart';

class MyInvoiceScreen extends StatefulWidget {
  const MyInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<MyInvoiceScreen> createState() => _MyInvoiceScreenState();
}

class _MyInvoiceScreenState extends State<MyInvoiceScreen> {

  List<Map<String, String>> data = [
    {"name" : "Mr. John Doe", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "180.00", "currency" : "USD"},
    {"name" : "Esther Howard", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "180.00", "currency" : "USD"},
    {"name" : "Leslie Alexander", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "20.00", "currency" : "USD"},
    {"name" : "Guy Hawkins", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "15.00", "currency" : "USD"},
    {"name" : "Albert Flores", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "50.00", "currency" : "USD"},
    {"name" : "Jerome Bell", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "250.00", "currency" : "USD"},
    {"name" : "Ronald Richards", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "137.00", "currency" : "USD"},
    {"name" : "Darrell Steward", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "290.00", "currency" : "USD"},
    {"name" : "Courtney Henry", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "20.00", "currency" : "USD"},
    {"name" : "Mitchel Stark", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "40.00", "currency" : "USD"},
    {"name" : "Json Roy", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "45.00", "currency" : "USD"},
    {"name" : "Johny Baristo", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "66.00", "currency" : "USD"},
    {"name" : "Abraham Torres", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "167.85", "currency" : "USD"},
    {"name" : "Xavi Hernandes", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "200.00", "currency" : "USD"},
    {"name" : "Marcos Rashford", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "36.00", "currency" : "USD"},
    {"name" : "Jose Linguard", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "65.00", "currency" : "USD",},
    {"name" : "Mario Dias", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "43.00", "currency" : "USD"},
    {"name" : "Adama Triore", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "442.00", "currency" : "USD"},
    {"name" : "Pickford", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Published", "amount" : "240.23", "currency" : "USD"},
    {"name" : "Manuel Nuer", "date" : "Sep 12, 2022", "time" : "6:00 am", "status" : "Discarded", "amount" : "53.12", "currency" : "USD"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: MyStrings.myInvoice,
          backgroundColor: MyColor.colorWhite,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Dimensions.space15),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.createInvoiceScreen);
                },
                child: Container(
                  height: 25, width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColor.colorWhite, border: Border.all(color: MyColor.primaryColor, width: 1.5),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.add, color: MyColor.primaryColor, size: 15),
                ),
              ),
            )
          ],
          changeRoute: () => Get.toNamed(RouteHelper.bottomNavBar),
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
                        Text("${data[index]["name"]}", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
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
                  MyInvoiceBottomSheet.bottomSheet(
                      context,
                      "${data[index]["name"]}",
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
    return status == "Discarded" ? MyColor.colorRed : MyColor.colorGreen;
  }

  Color getBgColor(String status){
    return status == "Discarded" ? MyColor.colorRed100 : MyColor.colorGreen100;
  }

  Color borderColor(String status){
    return status == "Discarded" ? MyColor.colorRed : MyColor.colorGreen;
  }
}
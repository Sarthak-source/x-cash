import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_search_field.dart';
import 'package:xcash_app/view/screens/transaction/widget/filters_field.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

  bool isVisible = false;
  bool isVisible2 = false;

  List<Map<String, String>> data = [
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
    {"image" : MyImages.arrowRightDown2, "title" : "Add Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "790.00 USD", "status" : "Successful"},
    {"image" : MyImages.arrowRightUp2, "title" : "Exchange Money", "date" : "Sep 12, 2022", "time" : "6:00 am", "amount" : "800.00 USD", "status" : "Canceled"},
  ];

  List<String> title = ["Transaction Type", "Operation Type", "History From", "Wallet Currency"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        // app bar
        appBar: CustomAppBar(
          elevation: 0,
          showBackIcon: true,
          title: "${MyStrings.transaction} History",
          backgroundColor: MyColor.colorWhite,
          actions: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(
                  color: MyColor.transparentColor,
                  shape: BoxShape.circle
                ),
                child: isVisible ? const Icon(Icons.clear, color: MyColor.colorRed, size: 20) : Image.asset(MyImages.search, color: MyColor.primarySubTextColor, height: 20, width: 20),
              ),
            ),

            const SizedBox(width: Dimensions.space15),

            GestureDetector(
              onTap: (){
                setState(() {
                  isVisible2 = !isVisible2;
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(Dimensions.space5),
                decoration: const BoxDecoration(
                    color: MyColor.transparentColor,
                    shape: BoxShape.circle
                ),
                child: Image.asset(MyImages.filter, color: isVisible2 ? MyColor.primaryColor : MyColor.primarySubTextColor, height: 20, width: 20),
              ),
            ),

            const SizedBox(width: Dimensions.space15),
          ],
          changeRoute: () => Get.toNamed(RouteHelper.bottomNavBar),
        ),

        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
          child: Column(
            children: [
              // search field
              Visibility(
                visible: isVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSearchField(
                        showLabelText: false,
                        hintText: "Search by transaction",
                        onChanged: (value){},
                        onPressed: (){}
                    ),
                    const SizedBox(height: Dimensions.space20),
                  ],
                ),
              ),

              // filters field
              Visibility(
                visible: isVisible2,
                child: Column(
                  children: const [
                    FiltersField(),

                    SizedBox(height: Dimensions.space20),
                  ],
                ),
              ),

              // card list
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 20,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index) => CustomCard(
                  paddingTop: Dimensions.space15,
                  paddingBottom: Dimensions.space15,
                  isPress: true,
                  onPressed: (){},
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50, height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: MyColor.colorWhite,
                              border: Border.all(color: borderColor("${data[index]['title']}"), width: 1.2),
                              shape: BoxShape.circle
                            ),
                            child: Container(
                              height: 45, width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: getBgColor("${data[index]['title']}"),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset("${data[index]["image"]}", height: 12, width: 12),
                            ),
                          ),
                          const SizedBox(width: Dimensions.space10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data[index]["title"]}", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                              const SizedBox(height: 8),
                              Text(
                                  "${data[index]["date"]} - ${data[index]["time"]}",
                                  style: interRegularSmall.copyWith(fontWeight: FontWeight.w500, color: MyColor.primarySubTextColor)
                              ),
                            ],
                          )
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${data[index]["amount"]}", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: Dimensions.space5 / 2, horizontal: Dimensions.space5),
                            decoration: BoxDecoration(
                                color: getStatusBgColor("${data[index]['status']}"),
                                borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                                "${data[index]['status']}",
                                textAlign: TextAlign.center,
                                style: interRegularSmall.copyWith(
                                    color: getTextColor("${data[index]['status']}"),
                                    fontWeight: FontWeight.w500
                                )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getTextColor(String status){
    return status == "Canceled" ? MyColor.colorRed : MyColor.colorGreen;
  }
  Color getStatusBgColor(String status){
    return status == "Canceled" ? MyColor.colorRed100 : MyColor.colorGreen100;
  }

  Color getBgColor(String title){
    return title == "Add Money" ? MyColor.colorGreen100 : MyColor.colorRed100;
  }

  Color borderColor(String title){
    return title == "Add Money" ? MyColor.colorGreen : MyColor.colorRed;
  }
}

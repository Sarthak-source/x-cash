import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/money_request_details.dart';

class ToMeList extends StatefulWidget {
  const ToMeList({Key? key}) : super(key: key);

  @override
  State<ToMeList> createState() => _ToMeListState();
}

class _ToMeListState extends State<ToMeList> {

  List<Map<String, dynamic>> data = [
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
    {"user" : "demouser demouser", "useStatus" :  "NOT USED", "date" : "Sep 12, 2022", "amount" : "489.00", "time" : "6.00 am"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
          itemBuilder: (context, index) => CustomCard(
            isPress: true,
            onPressed: (){
              MoneyRequestDetails.bottomSheet(context);
            },
            paddingTop: Dimensions.space15,
            paddingBottom: Dimensions.space15,
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data[index]["user"], style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(Dimensions.space5),
                          decoration: const BoxDecoration(
                              color: MyColor.screenBgColor,
                              shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset(MyImages.dotMenu, height: 13.5, width: 13.5)
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${data[index]["date"]} - ${data[index]["time"]}", style: regularSmall.copyWith(color: MyColor.contentTextColor)),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: data[index]["amount"].toString(), style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                              TextSpan(text: " USD", style: regularSmall)
                            ]
                        )
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

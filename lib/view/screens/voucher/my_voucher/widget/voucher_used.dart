import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class VoucherUsed extends StatefulWidget {
  const VoucherUsed({Key? key}) : super(key: key);

  @override
  State<VoucherUsed> createState() => _VoucherUsedState();
}

class _VoucherUsedState extends State<VoucherUsed> {
  
  List<Map<String, dynamic>> data = [
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "USED", "createDate" : "12 Jan, 2022", "amount" : 489.00, "usedAtDate" : "12 Sep, 2022", "usedAtTime" : "6.00"},
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
            paddingTop: Dimensions.space15,
            paddingBottom: Dimensions.space15,
            width: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data[index]["code"], style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5 / 2, horizontal: Dimensions.space5),
                      decoration: BoxDecoration(
                          color: MyColor.colorOrange100,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: MyColor.colorOrange, width: 0.5)
                      ),
                      child: Text(
                          "${data[index]['useStatus']}",
                          textAlign: TextAlign.center,
                          style: interRegularExtraSmall.copyWith(
                              color: MyColor.colorOrange,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: Dimensions.space5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Create at : ${data[index]["createDate"]}", style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor)),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(text: data[index]["amount"].toString(), style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                              TextSpan(text: " USD", style: interRegularSmall)
                            ]
                        )
                    )
                  ],
                ),

                const CustomDivider(height: Dimensions.space15),

                Text("Used At - ${data[index]["usedAtDate"]} - ${data[index]["usedAtTime"]} am", style: interRegularSmall)
              ],
            ),
          )
      ),
    );
  }
}

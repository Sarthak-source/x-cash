import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class VoucherNotUsed extends StatefulWidget {
  const VoucherNotUsed({Key? key}) : super(key: key);

  @override
  State<VoucherNotUsed> createState() => _VoucherNotUsedState();
}

class _VoucherNotUsedState extends State<VoucherNotUsed> {

  List<Map<String, dynamic>> data = [
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
    {"code" : "6775-2717-6927-2945", "useStatus" :  "NOT USED", "date" : "12 Jan, 2022", "amount" : 489.00, "usedAt" : "N/A"},
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
                  Text(data[index]["code"], style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.space5 / 2, horizontal: Dimensions.space5),
                    decoration: BoxDecoration(
                        color: MyColor.colorGreen100,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: MyColor.colorGreen, width: 0.5)
                    ),
                    child: Text(
                        "${data[index]['useStatus']}",
                        textAlign: TextAlign.center,
                        style: regularExtraSmall.copyWith(
                            color: MyColor.colorGreen,
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
                  Text("Create at : ${data[index]["date"]}", style: regularSmall.copyWith(color: MyColor.contentTextColor)),
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

              const CustomDivider(height: Dimensions.space15),

              Text("Used At - ${data[index]["usedAt"]}", style: regularSmall)
            ],
          ),
        )
      ),
    );
  }
}

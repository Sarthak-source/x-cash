import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {

  List<Map<String, dynamic>> data = [
    {"id" : 1, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 2, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 3, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 4, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 5, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 6, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 7, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 8, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 9, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 10, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 11, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 12, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 13, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 14, "data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"id" : 15, "data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: data.length,
        separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
        itemBuilder: (context, index) => CustomCard(
          width: MediaQuery.of(context).size.width,
          isPress: true,
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Dimensions.space10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: MyColor.primaryColor100,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(data[index]["data"]["image"], height: 16, width: 16),
                  ),
                  const SizedBox(width: Dimensions.space10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]["data"]["title"], style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(height: Dimensions.space5),
                      Text(data[index]["data"]["time-limit"], style: interRegularExtraSmall.copyWith(color: MyColor.primarySubTextColor)),
                      const SizedBox(height: Dimensions.space5),
                      Text("${data[index]["data"]["amount"]} USD", style: interRegularSmall.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: (){},
                child: SvgPicture.asset(MyImages.dotMenu, height: 12, width: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

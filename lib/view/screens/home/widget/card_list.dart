import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/row_icon_text_widget.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {

  List<Map<String, dynamic>> data = [
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyOut, "title":MyStrings.moneyOut, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
    {"data" : {"image":MyImages.moneyIn, "title":MyStrings.moneyIn, "time-limit": "Last 7 days", "amount": "674,475,999,995,140.00"}},
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
                        color: MyColor.screenBgColor,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(data[index]["data"]["image"], height: 16, width: 16),
                  ),
                  const SizedBox(width: Dimensions.space10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]["data"]["title"], style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(height: Dimensions.space5),
                      Text(data[index]["data"]["time-limit"], style: regularExtraSmall.copyWith(color: MyColor.contentTextColor)),
                      const SizedBox(height: Dimensions.space5),
                      Text("${data[index]["data"]["amount"]} USD", style: regularSmall.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                  CustomBottomSheet(
                    isNeedMargin: true,
                    child: Column(
                      children: [
                        const BottomSheetBar(),
                        const SizedBox(height: Dimensions.space15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowIconTextWidget(
                                image: data[index]["data"]["title"] == "Money In" ? MyImages.downLeftArrow : MyImages.arrowRightUp,
                                text: data[index]["data"]["title"] == "Money In" ? MyStrings.totalReceived : "Total Spent"
                            ),

                            const CustomDivider(space: Dimensions.space15),

                            RowIconTextWidget(
                                image: MyImages.requestMoney1,
                                text: data[index]["data"]["title"] == "Money In" ? MyStrings.requestMoney : "Send Money"
                            ),

                            const CustomDivider(space: Dimensions.space15),

                            const RowIconTextWidget(
                                image: MyImages.viewTransaction,
                                text: MyStrings.viewTransactions
                            ),
                          ],
                        )
                      ],
                    )
                  ).customBottomSheet(context);
                },
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
        ),
      ),
    );
  }
}

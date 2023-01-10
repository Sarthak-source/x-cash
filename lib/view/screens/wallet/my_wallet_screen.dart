import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';

import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {

  List<Map<String, String>> data = [
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "USD"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "USD"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "USD"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "USD"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "USD"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "3,481,070,153.92",
      "currency" : "NGN"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "0.92134943",
      "currency" : "ETH"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "8,578.96",
      "currency" : "BDT"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "0.00",
      "currency" : "INR"
    },
    {
      "image" : MyImages.transferMoney,
      "amount" : "0.000000000",
      "currency" : "BCH"
    }
  ];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          title: MyStrings.myWallet,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
          physics: const ClampingScrollPhysics(),
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: width > 400 ? 2.4 : 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => CustomCard(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleShapeImage(
                    isSvgImage: true,
                    image: data[index]["image"].toString(),
                  ),

                  const SizedBox(height: Dimensions.space10),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: data[index]["amount"], style: regularDefault.copyWith(fontWeight: FontWeight.w600)),
                        TextSpan(text: " ${data[index]["currency"]}", style: regularExtraSmall.copyWith(fontWeight: FontWeight.w600))
                      ]
                    ),
                  ),

                  const CustomDivider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        MyStrings.transferMoney,
                        style: regularSmall.copyWith(color: MyColor.contentTextColor),
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined, color: MyColor.primaryColor, size: 16)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

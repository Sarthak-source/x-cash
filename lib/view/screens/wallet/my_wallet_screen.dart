import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          elevation: 0,
          showBackIcon: true,
          title: MyStrings.myWallet,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
          physics: const BouncingScrollPhysics(),
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => CustomCard(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30, width: 30,

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';

import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/create_voucher.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/voucher_not_used.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/widget/voucher_used.dart';

class MyVoucherScreen extends StatefulWidget {
  const MyVoucherScreen({Key? key}) : super(key: key);

  @override
  State<MyVoucherScreen> createState() => _MyVoucherScreenState();
}

class _MyVoucherScreenState extends State<MyVoucherScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          title: MyStrings.myVoucher,
          /*actions: [
            IconButton(
              onPressed: (){
                CustomBottomSheet(
                  child: const RedeemVoucher()
                ).customBottomSheet(context);
              },
              icon: Icon(Icons.card_giftcard, color: MyColor.contentTextColor.withOpacity(0.8), size: 20),
            ),
            IconButton(
              onPressed: (){
                CustomBottomSheet(
                  child: const CreateVoucher()
                ).customBottomSheet(context);
              },
              icon: Icon(Icons.add_circle_outline_rounded, color: MyColor.contentTextColor.withOpacity(0.8), size: 20),
            ),
          ],*/
        ),
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    middleButtons(MyStrings.notUsed, 0),
                    middleButtons(MyStrings.used, 1),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Dimensions.space20),

            selectedIndex == 0 ? const Expanded(child: VoucherNotUsed()) : const Expanded(child: VoucherUsed()),
          ],
        ),
      ),
    );
  }

  middleButtons(String buttonName, int index) {
    return Expanded(
      child: GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = index;
            });
          },
          child: index == selectedIndex ? Container(

            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10),
            decoration: BoxDecoration(

                color: index == selectedIndex ? MyColor.primaryColor : MyColor.primaryColor,
                borderRadius: index == 0 ? const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)) :
                const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Text(buttonName, textAlign: TextAlign.center, style: regularSmall.copyWith(color: index == selectedIndex ? MyColor.colorWhite : MyColor.primaryColor)),
          ) : Container(

            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10),
            decoration: BoxDecoration(

                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(buttonName, textAlign: TextAlign.center, style: regularSmall.copyWith(color: MyColor.primaryColor)),
          )
      ),
    );
  }
}

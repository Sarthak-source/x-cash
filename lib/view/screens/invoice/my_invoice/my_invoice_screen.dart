import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/widget/my_invoice_bottom_sheet.dart';

class MyInvoiceScreen extends StatefulWidget {
  const MyInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<MyInvoiceScreen> createState() => _MyInvoiceScreenState();
}

class _MyInvoiceScreenState extends State<MyInvoiceScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          isShowBackBtn: true,
          title: MyStrings.myInvoice,
          /*actions: [
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
          changeRoute: () => Get.toNamed(RouteHelper.bottomNavBar),*/
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
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
                        Text("", style: regularDefault.copyWith(fontWeight: FontWeight.w500)),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: Dimensions.space5 / 2, horizontal: Dimensions.space5),
                          decoration: BoxDecoration(
                              color: getBgColor(""),
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: borderColor(""), width: 0.5)
                          ),
                          child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: regularExtraSmall.copyWith(
                                  color: getTextColor(""),
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
                        Text(" - ", style: regularSmall.copyWith(color: MyColor.contentTextColor)),
                        Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(text: "", style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                                TextSpan(text: " ", style: regularSmall.copyWith(fontWeight: FontWeight.w500))
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
                      "",
                      "",
                      "",
                      "",
                      ""
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
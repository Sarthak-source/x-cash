import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';

class LatestTransactionSection extends StatelessWidget {
  const LatestTransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
      decoration: BoxDecoration(color: MyColor.getCardBgColor()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.latestTransactions,
                style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.transactionHistoryScreen);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: MyColor.transparentColor,
                  padding: const EdgeInsets.all(Dimensions.space5),
                  child: Text(
                    MyStrings.seeAll,
                    textAlign: TextAlign.center,
                    style: regularSmall.copyWith(color: MyColor.getPrimaryColor()),
                  ),
                ),
              )
            ],
          ),
          const CustomDivider(space: Dimensions.space15),

          ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: 50,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
              itemBuilder: (context, index) {
                /*if(controller.transactionList.length == index){
                  return controller.hasNext() ? Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(5),
                      child: const CustomLoader()
                  ) : const SizedBox();
                }*/

                return  GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
                    decoration: BoxDecoration(color: MyColor.getScreenBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                    child: Text(index.toString()),
                  )
                );
              }
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/row_widget/bottom_sheet_row.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class BalanceBottomSheet extends StatefulWidget {
  const BalanceBottomSheet({Key? key}) : super(key: key);

  @override
  State<BalanceBottomSheet> createState() => _BalanceBottomSheetState();
}

class _BalanceBottomSheetState extends State<BalanceBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 5, width: 50,
              decoration: BoxDecoration(color: MyColor.colorGrey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [BottomSheetCloseButton()],
          ),
          const SizedBox(height: Dimensions.space20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomSheetHeaderText(text: "${controller.siteName} ${MyStrings.balance.tr}"),
              BottomSheetHeaderText(text: controller.userBalance)
            ],
          ),
          const SizedBox(height: Dimensions.space20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: controller.walletList.length,
            separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space8),
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.transferMoneyScreen, arguments: controller.walletList[index].id.toString());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                decoration: BoxDecoration(
                    border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5),
                    borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
                ),
                child: BottomSheetRow(
                    showSymbol: true,
                    currencySymbol: controller.walletList[index].currency?.currencySymbol ?? "",
                    header: controller.walletList[index].currencyCode ?? "",
                    body: "${controller.walletList[index].currency?.currencySymbol ?? ""}${Converter.formatNumber(controller.walletList[index].balance ?? "")}"
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.space20),
          GestureDetector(
            onTap: () => Get.toNamed(RouteHelper.myWalletScreen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space8, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5),
                      borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
                  ),
                  child: Text(MyStrings.seeAllWallets.tr, style: regularDefault.copyWith(color: MyColor.primaryColor)),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.space20),
          Text(
            MyStrings.estimateBalance.tr,
            style: regularSmall.copyWith(color: MyColor.colorBlack.withOpacity(0.8), fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: Dimensions.space20),
          RoundedButton(
            text: MyStrings.transferMoney.tr,
            press: () => Get.toNamed(RouteHelper.transferMoneyScreen),
          )
        ],
      ),
    );
  }
}

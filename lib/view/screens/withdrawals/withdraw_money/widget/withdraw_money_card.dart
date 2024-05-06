import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_money_controller.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class WithdrawMoneyCard extends StatelessWidget {
  final int index;
  final VoidCallback press;

  const WithdrawMoneyCard({
    Key? key,
    required this.index,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMoneyController>(
      builder: (controller) => GestureDetector(
        onTap: press,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
          decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35, width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: MyColor.getSymbolColor(index), shape: BoxShape.circle),
                        child: Image.asset(MyImages.withdrawMoney, color: MyColor.colorWhite, height: 17, width: 17),
                      ),
                      const SizedBox(width: Dimensions.space15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              controller.withdrawMoneyList[index].name?.tr ?? "",
                              style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                          ),
                          const SizedBox(height: Dimensions.space5),
                          Text(
                              "${controller.withdrawMoneyList[index].withdrawMethod?.name ?? ""} - ${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""}",
                              style: regularSmall.copyWith(color: MyColor.getPrimaryColor())
                          ),
                          const SizedBox(height: Dimensions.space10),
                        ],
                      )
                    ],
                  ),
                  StatusWidget(
                      status: controller.getStatusOrColor(index),
                      color: controller.getStatusOrColor(index, isStatus: false)
                  )
                ],
              ),
              const CustomDivider(space: Dimensions.space10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyStrings.limit.tr,
                        style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text(
                          "${Converter.formatNumber(controller.withdrawMoneyList[index].minLimit ?? "",precision:controller.withdrawMoneyList[index].currency?.currencyType=='2'?8:2)} ~ "
                              "${Converter.formatNumber(controller.withdrawMoneyList[index].maxLimit ?? "",precision:controller.withdrawMoneyList[index].currency?.currencyType=='2'?8:2)} "
                              "${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""}",
                          maxLines: 2,
                          style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                      ),
                    ],
                  )),
                  const SizedBox(width: Dimensions.space10),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        MyStrings.charge.tr,
                        style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                      ),
                      const SizedBox(height: Dimensions.space5),
                       Text(
                          "${Converter.calculateRate(controller.withdrawMoneyList[index].withdrawMethod?.fixedCharge??'0', controller.withdrawMoneyList[index].currency?.rate??'0')} "
                              "${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""} + "
                              "${Converter.formatNumber(controller.withdrawMoneyList[index].withdrawMethod?.percentCharge ?? "")}%",
                          maxLines: 2,
                          style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                      ),
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

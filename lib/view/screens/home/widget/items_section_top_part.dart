import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/add-money/add_money_details/add_money.dart';
import 'package:xcash_app/view/screens/exchange/exchange_money.dart';
import 'package:xcash_app/view/screens/money-discharge/make_payment/make_payment.dart';
import 'package:xcash_app/view/screens/money-discharge/money_out/money_out_details.dart';
import 'package:xcash_app/view/screens/request-money/request_money/request_money.dart';
import 'package:xcash_app/view/screens/transfer/transfer_money.dart';

class ItemsSectionTopPart extends StatefulWidget {
  const ItemsSectionTopPart({Key? key}) : super(key: key);

  @override
  State<ItemsSectionTopPart> createState() => _ItemsSectionTopPartState();
}

class _ItemsSectionTopPartState extends State<ItemsSectionTopPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            // add Money
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.addMoney,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.addMoney, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                    child: const AddMoney()
                  ).customBottomSheet(context);
                },
              ),
            ),

            // exchange
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.exchange,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.exchange, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                    child: const ExchangeMoney()
                  ).customBottomSheet(context);
                },
              ),
            ),

            // make payment
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.makePayment,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.makePayment, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                    child: const MakePayment()
                  ).customBottomSheet(context);
                },
              ),
            ),

            // invoice
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.inVoice,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.invoice, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.toNamed(RouteHelper.myInvoiceScreen);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.space20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // voucher
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.moneyOut,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: Image.asset(MyImages.moneyOut2, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                      child: const MoneyOutDetails()
                  ).customBottomSheet(context);
                },
              ),
            ),

            // transfer
            Expanded(
              child: CircleAnimatedButtonWithText(
                buttonName: MyStrings.transfer,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.transfer, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                    child: const TransferMoney()
                  ).customBottomSheet(context);
                },
              ),
            ),

            Expanded(

              child: CircleAnimatedButtonWithText(

                buttonName: MyStrings.requestMoney,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.requestMoney, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  CustomBottomSheet(
                    child: const RequestMoney()
                  ).customBottomSheet(context);
                },
              ),
            ),

            Expanded(

              child: CircleAnimatedButtonWithText(

                buttonName: MyStrings.withdraw,
                height: 40, width: 40,
                backgroundColor: MyColor.colorWhite,
                child: SvgPicture.asset(MyImages.withdraw, color: MyColor.primaryColor, height: 20, width: 20),
                onTap: (){
                  Get.toNamed(RouteHelper.withdrawMoneyScreen);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

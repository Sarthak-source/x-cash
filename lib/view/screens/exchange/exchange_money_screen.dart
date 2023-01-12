import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/exchange/exchange_money_controller.dart';
import 'package:xcash_app/data/model/exchange/exchange_money_response_model.dart';
import 'package:xcash_app/data/repo/exchange/exchange_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/exchange/widget/exchange_money_bottom_sheet.dart';

class ExchangeMoneyScreen extends StatefulWidget {
  const ExchangeMoneyScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeMoneyScreen> createState() => _ExchangeMoneyScreenState();
}

class _ExchangeMoneyScreenState extends State<ExchangeMoneyScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ExchangeMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(ExchangeMoneyController(exchangeMoneyRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ExchangeMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            title: MyStrings.exchangeMoney,
            isShowBackBtn: true,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const Center(
              child: CustomLoader()
          ): SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const LabelText(text: MyStrings.fromCurrency),
                             const SizedBox(height: 8),
                             Container(
                               width: MediaQuery.of(context).size.width,
                               padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
                               decoration: BoxDecoration(
                                 color: MyColor.primaryColor,
                                 borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                               ),
                               child: DropdownButton<FromWallets>(
                                 dropdownColor: MyColor.primaryColor,
                                 value: controller.fromWalletMethod,
                                 elevation: 8,
                                 icon: const Icon(Icons.arrow_drop_down_outlined, color: MyColor.colorWhite),
                                 iconDisabledColor: Colors.red,
                                 iconEnabledColor : MyColor.primaryColor,
                                 isExpanded: true,
                                 underline: Container(height: 0, color: MyColor.primaryColor),
                                 onChanged: (FromWallets? newValue) {
                                   controller.setFromWalletMethod(newValue);
                                 },
                                 items: controller.fromWalletList.map((FromWallets wallet) {
                                   return DropdownMenuItem<FromWallets>(
                                     value: wallet,
                                     child: Text(wallet.currencyCode.toString(), style: regularDefault.copyWith(color: MyColor.colorWhite)),
                                   );
                                 }).toList(),
                               ),
                             ),
                           ],
                         )
                     ),
                     const SizedBox(width: Dimensions.space20),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const LabelText(text: MyStrings.toCurrency),
                           const SizedBox(height: 8),
                           Container(
                               width: MediaQuery.of(context).size.width,
                               padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
                               decoration: BoxDecoration(
                                   color: MyColor.transparentColor,
                                   borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                   border: Border.all(color: MyColor.borderColor, width: 0.5)
                               ),
                               child: DropdownButton<ToWallets>(
                                 dropdownColor: MyColor.colorWhite,
                                 value: controller.toWalletMethod,
                                 elevation: 8,
                                 icon: const Icon(Icons.arrow_drop_down_outlined, color: MyColor.colorBlack),
                                 iconDisabledColor: Colors.red,
                                 iconEnabledColor : MyColor.primaryColor,
                                 isExpanded: true,
                                 underline: Container(height: 0, color: MyColor.primaryColor),
                                 onChanged: (ToWallets? newValue) {
                                   controller.setToWalletMethod(newValue);
                                 },
                                 items: controller.toWalletList.map((ToWallets wallet) {
                                   return DropdownMenuItem<ToWallets>(
                                     value: wallet,
                                     child: Text(wallet.currencyCode.toString(), style: regularDefault.copyWith(color: MyColor.colorBlack)),
                                   );
                                 }).toList(),
                               )
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
                 CustomAmountTextField(
                    labelText: MyStrings.amount,
                    hintText: MyStrings.amountHint,
                    onChanged: (value){},
                    controller: controller.amountController,
                    currency: controller.currency
                ),
                 const SizedBox(height: Dimensions.space25),
                 const SizedBox(height: Dimensions.space30),
                 RoundedButton(
                   press: (){
                     if(controller.canExchange()){
                       CustomBottomSheet(
                           child: const ExchangeMoneyBottomSheet()
                       ).customBottomSheet(context);
                     }
                   },
                   text: MyStrings.exchange,
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

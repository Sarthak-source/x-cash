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
import 'package:xcash_app/view/components/bottom-sheet/custom_modal_bottom_sheet.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

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
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelText(text: MyStrings.fromCurrency),
                          const SizedBox(height: Dimensions.textToTextSpace),
                          FilterRowWidget(
                              borderColor: controller.fromWalletMethod?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                              text: "${controller.fromWalletMethod?.id.toString() == "-1" ? MyStrings.selectOne : controller.fromWalletMethod?.currencyCode}",
                              press: () => customModalBottomSheet(
                                  context: context,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 5,
                                          width: 50,
                                          padding: const EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: MyColor.colorGrey.withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.space15),
                                      Expanded(
                                        child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            physics: const BouncingScrollPhysics(),
                                            itemCount: controller.fromWalletList.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    final controller = Get.find<ExchangeMoneyController>();
                                                    FromWallets selectedValue = controller.fromWalletList[index];
                                                    controller.setFromWalletMethod(selectedValue);
                                                    Navigator.pop(context);

                                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                                    if (!currentFocus.hasPrimaryFocus) {
                                                      currentFocus.unfocus();
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(15),
                                                    margin: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                                        border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                                    ),
                                                    child: Text(
                                                      controller.fromWalletList[index].currencyCode ?? "",
                                                      style: regularDefault,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimensions.space8),
                    Expanded(
                      flex: 2,
                      child: CustomAmountTextField(
                          labelText: MyStrings.amount,
                          hintText: MyStrings.amountHint,
                          onChanged: (value){
                            if(value.toString().isEmpty){
                              controller.calculateExchangeAmount(0);
                            }else{
                              double amount = double.tryParse(value.toString()) ?? 0;
                              controller.calculateExchangeAmount(amount);
                            }
                          },
                          controller: controller.amountController,
                          currency: controller.currency
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.space20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelText(text: MyStrings.toCurrency),
                          const SizedBox(height: Dimensions.textToTextSpace),
                          FilterRowWidget(
                              borderColor: controller.toWalletMethod?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                              text: "${controller.toWalletMethod?.id.toString() == "-1" ? MyStrings.selectOne : controller.toWalletMethod?.currencyCode}",
                              press: () => customModalBottomSheet(
                                  context: context,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 5,
                                          width: 50,
                                          padding: const EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: MyColor.colorGrey.withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: Dimensions.space15),
                                      Expanded(
                                        child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            physics: const BouncingScrollPhysics(),
                                            itemCount: controller.toWalletList.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {
                                                    final controller = Get.find<ExchangeMoneyController>();
                                                    ToWallets selectedValue = controller.toWalletList[index];
                                                    controller.setToWalletMethod(selectedValue);
                                                    Navigator.pop(context);

                                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                                    if (!currentFocus.hasPrimaryFocus) {
                                                      currentFocus.unfocus();
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(15),
                                                    margin: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                                        border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                                    ),
                                                    child: Text(
                                                      controller.toWalletList[index].currencyCode ?? "",
                                                      style: regularDefault,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimensions.space8),
                    Expanded(
                      flex: 2,
                      child: CustomAmountTextField(
                          readOnly: true,
                          labelText: MyStrings.amount,
                          hintText: MyStrings.amountHint,
                          onChanged: (value){},
                          controller: controller.toAmountController,
                          currency: controller.toCurrency
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.space30),

                /*RoundedButton(
                   press: (){
                     if(controller.canExchange()){
                       CustomBottomSheet(
                           child: const ExchangeMoneyBottomSheet()
                       ).customBottomSheet(context);
                     }
                   },
                   text: MyStrings.exchange,
                 )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

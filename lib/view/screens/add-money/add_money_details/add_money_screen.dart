import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_method_controller.dart';
import 'package:xcash_app/data/model/add_money/add_money_method_response_model.dart';
import 'package:xcash_app/data/repo/add_money/add_money_method_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/add-money/add_money_details/widget/add_money_info_widget.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(AddMoneyMethodRepo(apiClient: Get.find()));
    final controller = Get.put(AddMoneyMethodController(addMoneyMethodRepo: Get.find()));

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
    
    return GetBuilder<AddMoneyMethodController>(
      builder: (controller) => SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.getScreenBgColor(),
            appBar: CustomAppBar(
              title: MyStrings.addMoney,
              isShowBackBtn: true,
              bgColor: MyColor.getAppBarColor(),
            ),
            body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
              padding: Dimensions.screenPaddingHV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelText(text: MyStrings.selectWallet),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
                    decoration: BoxDecoration(
                        color: MyColor.transparentColor,
                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                        border: Border.all(color: MyColor.primaryColor, width: 0.5)
                    ),
                    child: DropdownButton<AddMoneyWallets>(
                      dropdownColor: MyColor.colorWhite,
                      value: controller.selectedWallet,
                      elevation: 8,
                      icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                      iconDisabledColor: Colors.red,
                      iconEnabledColor : MyColor.primaryColor,
                      isExpanded: true,
                      underline: Container(height: 0, color: MyColor.primaryColor),
                      onChanged: (AddMoneyWallets? newValue) {
                        controller.setWallet(newValue);
                      },
                      items: controller.walletList.map((AddMoneyWallets wallet) {
                        return DropdownMenuItem<AddMoneyWallets>(
                          value: wallet,
                          child: Text(wallet.currencyCode.toString(), style: regularDefault),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.space20),

                  const LabelText(text: MyStrings.selectGateway),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
                    decoration: BoxDecoration(
                        color: MyColor.transparentColor,
                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                        border: Border.all(color: MyColor.primaryColor, width: 0.5)
                    ),
                    child: DropdownButton<Gateways>(
                      dropdownColor: MyColor.colorWhite,
                      value: controller.selectedGateway,
                      elevation: 8,
                      icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                      iconDisabledColor: Colors.red,
                      iconEnabledColor : MyColor.primaryColor,
                      isExpanded: true,
                      underline: Container(height: 0, color: MyColor.primaryColor),
                      onChanged: (Gateways? newValue) {
                        controller.setGatewayMethod(newValue);
                      },
                      items: controller.gatewayList.map((Gateways gateways) {
                        return DropdownMenuItem<Gateways>(
                          value: gateways,
                          child: Text(gateways.name.toString(), style: regularDefault),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.space20),

                  CustomAmountTextField(
                    labelText: MyStrings.amount,
                    hintText: MyStrings.amountHint,
                    currency: controller.currency,
                    controller: controller.amountController,
                    onChanged: (value){
                      if(value.toString().isEmpty){
                        controller.changeInfoWidgetValue(0);
                      }else{
                        double amount = double.tryParse(value.toString())??0;
                        controller.changeInfoWidgetValue(amount);
                      }
                    },
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Text(
                    "${MyStrings.depositLimit}: ${controller.depositLimit}",
                    style: regularExtraSmall.copyWith(color: MyColor.getPrimaryColor(), fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: Dimensions.space20),

                  controller.mainAmount > 0 ? const AddMoneyInfoWidget() : const SizedBox(),

                  const SizedBox(height: Dimensions.space30),
                  controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    press: (){},
                    text: MyStrings.proceed,
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


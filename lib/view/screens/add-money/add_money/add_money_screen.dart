import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/add_money/add_money_method_controller.dart';
import 'package:xcash_app/data/model/add_money/add_money_method_response_model.dart';
import 'package:xcash_app/data/repo/add_money/add_money_method_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/screens/add-money/add_money/widget/add_money_info_widget.dart';

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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: MyColor.getAppBarColor(),
              title: Text(MyStrings.addMoney.tr, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
              ),
              actions: [
                ActionButtonIconWidget(
                  pressed: () => Get.toNamed(RouteHelper.addMoneyHistoryScreen),
                  isImage: true,
                  imageSrc: MyImages.moneyHistory,
                )
              ],
            ),
            body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
              padding: Dimensions.screenPaddingHV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownTextField(
                    labelText: MyStrings.selectWallet.tr,
                    selectedValue: controller.selectedWallet,
                    onChanged: (newValue) {
                      controller.setWallet(newValue);
                    },
                    items: controller.walletList.map((AddMoneyWallets wallet) {
                      return DropdownMenuItem<AddMoneyWallets>(
                        value: wallet,
                        child: Text(wallet.currencyCode.toString(), style: regularDefault),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: Dimensions.space20),
                  CustomDropDownTextField(
                    labelText: MyStrings.selectGateway.tr,
                    selectedValue: controller.selectedGateway,
                    onChanged: (newValue) {
                      controller.setGatewayMethod(newValue);
                    },
                    items: controller.gatewayList.map((Gateways gateways) {
                      return DropdownMenuItem<Gateways>(
                        value: gateways,
                        child: Text(gateways.name.toString(), style: regularDefault),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: Dimensions.space20),
                  CustomAmountTextField(
                    labelText: MyStrings.amount.tr,
                    hintText: MyStrings.amountHint.tr,
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
                    "${MyStrings.depositLimit.tr}: ${controller.depositMinLimit} - ${controller.depositMaxLimit} ${controller.currency}",
                    style: regularExtraSmall.copyWith(color: MyColor.getPrimaryColor(), fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: Dimensions.space20),
                  controller.mainAmount > 0 ? const AddMoneyInfoWidget() : const SizedBox(),
                  const SizedBox(height: Dimensions.space30),
                  controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    press: (){
                      controller.submitData();
                    },
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transfer/transfer_money_controller.dart';
import 'package:xcash_app/data/repo/transfer/transfer_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';

import '../../../data/model/transfer/transfer_money_response_model.dart' as tm_model;

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TransferMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(TransferMoneyController(transferMoneyRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String walletId = Get.arguments??'';
      controller.loadData(walletId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            isShowBackBtn: true,
            title: MyStrings.transferMoney,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Form(
              key: formKey,
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
                    child: DropdownButton<tm_model.Wallets>(
                      dropdownColor: MyColor.colorWhite,
                      value: controller.selectedWallet,
                      elevation: 8,
                      icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                      iconDisabledColor: Colors.red,
                      iconEnabledColor : MyColor.primaryColor,
                      isExpanded: true,
                      underline: Container(height: 0, color: MyColor.primaryColor),
                      onChanged: (tm_model.Wallets? newValue) {
                        controller.setSelectedWallet(newValue);
                      },
                      items: controller.walletList.map((tm_model.Wallets wallet) {
                        return DropdownMenuItem<tm_model.Wallets>(
                          value: wallet,
                          child: Text(wallet.currencyCode.toString(), style: regularDefault),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.space10 / 2),
                  Text(MyStrings.chargeAmount, style: regularExtraSmall.copyWith(color: MyColor.primaryColor)),
                  
                  const SizedBox(height: Dimensions.space20),
                  
                  CustomTextField(
                      needOutlineBorder: true,
                      controller: controller.receiverController,
                      labelText: MyStrings.receiverUsernameEmail,
                      hintText: MyStrings.receiverUsernameHint,
                      onChanged: (value){}
                  ),
                  
                  const SizedBox(height: Dimensions.space20),
                  
                  CustomAmountTextField(
                    labelText: MyStrings.amount,
                    hintText: MyStrings.amountHint,
                    onChanged: (value){},
                    currency: controller.currency,
                    controller: controller.amountController,
                  ),
                  const SizedBox(height: Dimensions.space10 / 2),
                  Text(MyStrings.minMaxAmount, style: regularExtraSmall.copyWith(color: MyColor.primaryColor)),
                  
                  const SizedBox(height: Dimensions.space20),
                  
                  const LabelText(text: MyStrings.selectOtp),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15,),
                    decoration: BoxDecoration(
                        color: MyColor.transparentColor,
                        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                        border: Border.all(color: MyColor.primaryColor, width: 0.5)
                    ),
                    child: DropdownButton(
                      dropdownColor: MyColor.colorWhite,
                      value: controller.selectedOtp,
                      elevation: 8,
                      icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                      iconDisabledColor: Colors.red,
                      iconEnabledColor : MyColor.primaryColor,
                      isExpanded: true,
                      underline: Container(height: 0, color: MyColor.primaryColor),
                      onChanged: (newValue) {
                        controller.setSelectedOtp(newValue.toString());
                      },
                      items: controller.otpTypeList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.toString(), style: regularDefault),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: Dimensions.space25),
                  controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    press: (){
                      if(formKey.currentState!.validate()){
                        controller.submitTransferMoney();
                      }
                    },
                    text: MyStrings.transferNow,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

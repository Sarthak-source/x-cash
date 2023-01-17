import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/request_money/request_money/request_money_controller.dart';
import 'package:xcash_app/data/repo/request_money/request_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';

import '../../../../data/model/request_money/request_money/request_money_response_model.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({Key? key}) : super(key: key);

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(RequestMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(RequestMoneyController(requestMoneyRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            title: MyStrings.requestMoney,
            isShowBackBtn: true,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: controller.isLoading ? const Center(
              child: CustomLoader()
            ) : Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
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
                        child: DropdownButton<Wallets>(
                          dropdownColor: MyColor.colorWhite,
                          value: controller.selectedWallet,
                          elevation: 8,
                          icon: const Icon(Icons.keyboard_arrow_down, color: MyColor.primaryColor),
                          iconDisabledColor: Colors.red,
                          iconEnabledColor : MyColor.primaryColor,
                          isExpanded: true,
                          underline: Container(height: 0, color: MyColor.primaryColor),
                          onChanged: (Wallets? newValue) {
                            controller.setWalletMethod(newValue);
                          },
                          items: controller.walletList.map((Wallets wallet) {
                            return DropdownMenuItem<Wallets>(
                              value: wallet,
                              child: Text(wallet.currencyCode.toString(), style: regularDefault),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text("${MyStrings.totalCharge}: ", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
                    ],
                  ),
                  const SizedBox(height: Dimensions.space15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAmountTextField(
                        controller: controller.amountController,
                        labelText: MyStrings.amountToRequest,
                        hintText: MyStrings.amountHint,
                        onChanged: (value){},
                        currency: controller.currency,
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text("Limit: 1.00000000 ~ 100.0000000 USD", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
                    ],
                  ),
                  const SizedBox(height: Dimensions.space15),
                  CustomTextField(
                      needOutlineBorder: true,
                      controller: controller.requestToController,
                      labelText: MyStrings.requestTo,
                      hintText: MyStrings.enterEmailOrUserName,
                      onChanged: (value){
                        if(value == null && value.toString().isEmpty){
                          CustomSnackBar.error(errorList: [MyStrings.enterEmailOrUserName]);
                        }
                      }
                  ),
                  const SizedBox(height: Dimensions.space15),
                  CustomTextField(
                    controller: controller.noteController,
                    needOutlineBorder: true,
                    maxLines: 4,
                    labelText: MyStrings.noteForRecipient,
                    onChanged: (value){},
                  ),
                  const SizedBox(height: Dimensions.space25),
                  controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    press: (){
                      if(formKey.currentState!.validate()){
                        controller.submitRequest();
                      }
                    },
                    text: MyStrings.requestNow,
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


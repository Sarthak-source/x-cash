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
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/screens/request-money/request_money/widget/request_money_bottom_sheet.dart';

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
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropDownTextField(
                        labelText: MyStrings.selectWallet,
                        selectedValue: controller.selectedWallet,
                        onChanged: (value) => controller.setWalletMethod(value),
                        items: controller.walletList.map((Wallets wallet) {
                          return DropdownMenuItem<Wallets>(
                            value: wallet,
                            child: Text(wallet.currencyCode.toString(), style: regularDefault),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text("${MyStrings.totalCharge}: ${controller.totalCharge} ${controller.currency}", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
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
                        onChanged: (value){
                          if(value.toString().isEmpty){
                            controller.changeInfoWidget(0);
                          }else{
                            double amount = double.tryParse(value.toString())??0;
                            controller.changeInfoWidget(amount);
                          }
                        },
                        currency: controller.currency,
                      ),
                      const SizedBox(height: Dimensions.space5),
                      Text(
                          "${MyStrings.limit}: ${controller.limit}",
                          style: regularExtraSmall.copyWith(color: MyColor.primaryColor)
                      )
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
                  RoundedButton(
                    press: (){
                        CustomBottomSheet(child: const RequestMoneyBottomSheet()).customBottomSheet(context);
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


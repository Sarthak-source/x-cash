import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/request_money/request_money/request_money_controller.dart';
import 'package:xcash_app/data/repo/request_money/request_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/text_field_person_validity_widget.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            title: MyStrings.requestMoney.tr,
            isShowBackBtn: true,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText(text: MyStrings.selectWallet),
                    const SizedBox(height: Dimensions.textToTextSpace),
                    FilterRowWidget(
                        borderColor: controller.selectedWallet?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                        text: "${controller.selectedWallet?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedWallet?.currencyCode}",
                        press: () => CustomBottomSheet(
                          child: Column(
                            children: [
                              const BottomSheetHeaderRow(header: ''),
                              const SizedBox(height: Dimensions.space15),
                              ListView.builder(
                                  itemCount: controller.walletList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        final controller= Get.find<RequestMoneyController>();
                                        Wallets selectedValue = controller.walletList[index];
                                        controller.setWalletMethod(selectedValue);
                                        Navigator.pop(context);

                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                      },
                                      child: BottomSheetCard(
                                        child: Text(
                                          controller.walletList[index].currencyCode?.tr ?? "",
                                          style: regularDefault,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          )
                        ).customBottomSheet(context)
                    ),
                    const SizedBox(height: Dimensions.space5),
                    Text("${MyStrings.totalCharge.tr}: ${controller.charge}", style: regularExtraSmall.copyWith(color: MyColor.primaryColor))
                  ],
                ),
                const SizedBox(height: Dimensions.space15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAmountTextField(
                      controller: controller.amountController,
                      labelText: MyStrings.amountToRequest.tr,
                      hintText: MyStrings.amountHint.tr,
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
                        "${MyStrings.limit.tr}: ${Converter.formatNumber(controller.limit)}",
                        style: regularExtraSmall.copyWith(color: MyColor.primaryColor)
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.space15),
                Focus(
                  onFocusChange: (hasFocus){
                    if(!hasFocus){
                      controller.checkUserFocus(hasFocus);
                    }
                  },
                  child: CustomTextField(
                      needOutlineBorder: true,
                      controller: controller.requestToController,
                      labelText: MyStrings.requestTo.tr,
                      hintText: MyStrings.enterEmailOrUserName.tr,
                      onChanged: (value){
                        if(value == null && value.toString().isEmpty){
                          CustomSnackBar.error(errorList: [MyStrings.enterEmailOrUserName.tr]);
                        }
                      }
                  ),
                ),
                const SizedBox(height: Dimensions.space5),
                TextFieldPersonValidityWidget(
                    isVisible: controller.isAgentFound,
                    validMsg: controller.validUser,
                    invalidMsg: controller.invalidUser
                ),
                const SizedBox(height: Dimensions.space15),
                CustomTextField(
                  controller: controller.noteController,
                  needOutlineBorder: true,
                  maxLines: 2,
                  labelText: MyStrings.noteForRecipient.tr,
                  onChanged: (value){

                  },
                ),
                const SizedBox(height: Dimensions.space30),
                RoundedButton(
                  press: (){
                    FocusScope.of(context).unfocus();
                    controller.checkValidation(context);
                  },
                  text: MyStrings.requestNow.tr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


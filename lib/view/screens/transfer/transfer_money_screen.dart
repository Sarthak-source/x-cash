import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transfer/transfer_money_controller.dart';
import 'package:xcash_app/data/model/transfer/transfer_money_response_model.dart' as tm_model;
import 'package:xcash_app/data/repo/transfer/transfer_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/text_field_person_validity_widget.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

class TransferMoneyScreen extends StatefulWidget {
  const TransferMoneyScreen({Key? key}) : super(key: key);

  @override
  State<TransferMoneyScreen> createState() => _TransferMoneyScreenState();
}

class _TransferMoneyScreenState extends State<TransferMoneyScreen> {

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            isShowBackBtn: true,
            title: MyStrings.transferMoney.tr,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Column(
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
                          const BottomSheetBar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              BottomSheetCloseButton()
                            ],
                          ),
                          const SizedBox(height: Dimensions.space15),
                          ListView.builder(
                              itemCount: controller.walletList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    final controller= Get.find<TransferMoneyController>();
                                    tm_model.Wallets selectedValue = controller.walletList[index];
                                    controller.setSelectedWallet(selectedValue);
                                    Navigator.pop(context);

                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                  child: BottomSheetCard(
                                    child: Text(
                                      controller.walletList[index].currencyCode.toString() ?? "",
                                      style: regularDefault,
                                    ),
                                  ),
                                );
                              })
                        ],
                      )
                    ).customBottomSheet(context)
                ),
                const SizedBox(height: Dimensions.space5),
                Text(
                  "${MyStrings.totalCharge.tr}: ${controller.charge}",
                  style: regularExtraSmall.copyWith(color: MyColor.primaryColor),
                ),
                const SizedBox(height: Dimensions.space15),
                CustomAmountTextField(
                  labelText: MyStrings.amount.tr,
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
                  controller: controller.amountController,
                ),
                const SizedBox(height: Dimensions.space5),
                Text(
                    "${MyStrings.limit.tr}: ${controller.minLimit} - ${controller.maxLimit} ${controller.currency}",
                    style: regularExtraSmall.copyWith(color: MyColor.primaryColor)
                ),
                const SizedBox(height: Dimensions.space15),
                FocusScope(
                  child: Focus(
                    onFocusChange: (hasFocus){
                      if(!hasFocus){
                        controller.checkUserFocus(hasFocus);
                      }
                    },
                    child: CustomTextField(
                        needOutlineBorder: true,
                        controller: controller.receiverController,
                        labelText: MyStrings.receiverUsernameEmail.tr,
                        hintText: MyStrings.receiverUsernameHint.tr,
                        onChanged: (value){},
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.space5),
                TextFieldPersonValidityWidget(
                    isVisible: controller.isUserFound,
                    validMsg: controller.validUser,
                    invalidMsg: controller.invalidUser
                ),
                const SizedBox(height: Dimensions.space15),

                const LabelText(text: MyStrings.selectOtp),
                const SizedBox(height: Dimensions.textToTextSpace),
                FilterRowWidget(
                    borderColor: controller.selectedOtp == MyStrings.selectOtp ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                    text: controller.selectedOtp.toTitleCase(),
                    press: (){
                      FocusScope.of(context).unfocus();
                      CustomBottomSheet(
                          child: Column(
                            children: [
                              const BottomSheetBar(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  BottomSheetCloseButton()
                                ],
                              ),
                              const SizedBox(height: Dimensions.space15),
                              ListView.builder(
                                  itemCount: controller.otpTypeList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        final controller= Get.find<TransferMoneyController>();
                                        String selectedValue = controller.otpTypeList[index];
                                        controller.setSelectedOtp(selectedValue);
                                        Navigator.pop(context);

                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                      },
                                      child: BottomSheetCard(
                                        child: Text(
                                          controller.otpTypeList[index].toString().toTitleCase(),
                                          style: regularDefault,
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          )
                      ).customBottomSheet(context);
                    }
                ),
                const SizedBox(height: Dimensions.space30),
                RoundedButton(
                  press: (){
                    FocusScope.of(context).unfocus();
                    controller.checkAndShowPreviewBottomSheet(context);
                  },
                  text: MyStrings.transferNow.tr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

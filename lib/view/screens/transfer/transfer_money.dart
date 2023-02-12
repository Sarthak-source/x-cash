import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transfer/transfer_money_controller.dart';
import 'package:xcash_app/data/repo/transfer/transfer_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';
import 'package:xcash_app/view/screens/transfer/widget/transfer_money_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transfer/widget/transfer_money_otp_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transfer/widget/transfer_money_wallet_bottom_sheet.dart';

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
            title: MyStrings.transferMoney.tr,
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
                  const SizedBox(height: Dimensions.textToTextSpace),
                  FilterRowWidget(
                      borderColor: controller.selectedWallet?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                      text: "${controller.selectedWallet?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedWallet?.currencyCode}",
                      press: () {
                        showTransferMoneyWalletBottomSheet(controller.walletList, context: context);
                      }
                  ),
                  const SizedBox(height: Dimensions.space5),
                  Text(
                    "${MyStrings.totalCharge.tr}: ${Converter.twoDecimalPlaceFixedWithoutRounding(controller.model.data?.transferCharge?.fixedCharge ?? "")} ${controller.currency}",
                    style: regularExtraSmall.copyWith(color: MyColor.primaryColor),
                  ),
                  const SizedBox(height: Dimensions.space20),
                  CustomTextField(
                      needOutlineBorder: true,
                      controller: controller.receiverController,
                      labelText: MyStrings.receiverUsernameEmail.tr,
                      hintText: MyStrings.receiverUsernameHint.tr,
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space20),
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
                  const SizedBox(height: Dimensions.space20),
                  const LabelText(text: MyStrings.selectOtp),
                  const SizedBox(height: Dimensions.textToTextSpace),
                  FilterRowWidget(
                      borderColor: controller.selectedOtp == MyStrings.selectOtp ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                      text: controller.selectedOtp.toTitleCase(),
                      press: () {
                        showTransferMoneyOTPBottomSheet(controller.otpTypeList, context: context);
                      }
                  ),
                  const SizedBox(height: Dimensions.space25),
                  RoundedButton(
                    press: (){
                      if(formKey.currentState!.validate()){
                        CustomBottomSheet(child: const TransferMoneyBottomSheet()).customBottomSheet(context);
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

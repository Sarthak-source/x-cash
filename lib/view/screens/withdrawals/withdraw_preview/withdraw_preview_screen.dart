import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_preview_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';

class WithdrawPreviewScreen extends StatefulWidget {
  const WithdrawPreviewScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawPreviewScreen> createState() => _WithdrawPreviewScreenState();
}

class _WithdrawPreviewScreenState extends State<WithdrawPreviewScreen> {

  late String trxId;
  late String methodName;
  late String requestedAmount;
  late String totalBalance;

  @override
  void initState() {
    methodName = Get.arguments[0];
    trxId = Get.arguments[1];
    requestedAmount = Get.arguments[2];

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawPreviewController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadData(trxId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawPreviewController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: CustomAppBar(
            title: MyStrings.withdrawPreview.tr,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: MyColor.getCardBgColor(),
                      borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        methodName.tr, style: regularDefault.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const CustomDivider(space: Dimensions.space15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.requestedAmount.tr,
                            style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                          ),
                          Text(
                            "$requestedAmount ${controller.currency}",
                            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const CustomDivider(space: Dimensions.space15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.withdrawCharge.tr,
                            style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                          ),
                          Text(
                            "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawCharge)} ${controller.currency}",
                            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const CustomDivider(space: Dimensions.space15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.youWillGet.tr,
                            style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                          ),
                          Text(
                            "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.youWillGet)} ${controller.currency}",
                            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const CustomDivider(space: Dimensions.space15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyStrings.yourBalanceWillBe.tr,
                            style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                          ),
                          Text(
                            "$requestedAmount ${controller.currency}",
                            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.space20),
                CustomDropDownTextField(
                  labelText: MyStrings.selectOtp.tr,
                  selectedValue: controller.selectedOtp,
                  onChanged: (newValue) {
                    controller.setSelectedOTP(newValue.toString());
                  },
                  items: controller.otpTypeList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.toString().toTitleCase(), style: regularDefault),
                    );
                  }).toList(),
                ),
                const SizedBox(height: Dimensions.space25),
                controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    text: MyStrings.confirm,
                    press: (){
                      controller.submitMoney(trxId: trxId);
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

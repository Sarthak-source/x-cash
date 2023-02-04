import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/voucher/redeem_voucher_controller.dart';
import 'package:xcash_app/data/repo/voucher/redeem_voucher_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class RedeemVoucher extends StatefulWidget {
  const RedeemVoucher({Key? key}) : super(key: key);

  @override
  State<RedeemVoucher> createState() => _RedeemVoucherState();
}

class _RedeemVoucherState extends State<RedeemVoucher> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(RedeemVoucherRepo(apiClient: Get.find()));
    final controller = Get.put(RedeemVoucherController(redeemVoucherRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.codeController.text = "";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RedeemVoucherController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.redeemVoucher),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.redeemLogScreen);
                },
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.space15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: MyColor.getPrimaryColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(MyImages.email, color: MyColor.colorWhite, height: 16, width: 16),
                      const SizedBox(width: Dimensions.space10),
                      Text(MyStrings.redeemLog.tr, style: regularSmall.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: Dimensions.space20),
          Form(
            key: formKey,
            child: CustomTextField(
              needOutlineBorder: true,
              labelText: MyStrings.voucherCode.tr,
              hintText: MyStrings.enterVoucherCode.tr,
              controller: controller.codeController,
              onChanged: (value){},
              validator: (value){
                if(value.toString().isEmpty){
                  return MyStrings.errorMsgVoucherCode;
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: Dimensions.space25),
          controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
              press: (){
                if(formKey.currentState!.validate()){
                  controller.submitRedeemVoucher();
                }
              },
              text:MyStrings.redeemVoucher
          )
        ],
      ),
    );
  }
}

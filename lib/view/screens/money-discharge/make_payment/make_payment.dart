import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/data/controller/money_discharge/make_payment/make_payment_controller.dart';
import 'package:xcash_app/data/repo/money_discharge/make_payment/make_payment_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/money-discharge/make_payment/widget/make_payment_form.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(MakePaymentRepo(apiClient: Get.find()));
    final controller = Get.put(MakePaymentController(makePaymentRepo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.beforeInitLoadData();
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakePaymentController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BottomSheetHeaderText(text: MyStrings.makePayment),
              BottomSheetCloseButton()
            ],
          ),
          const CustomDivider(height: Dimensions.space15),
          const MakePaymentForm()
        ],
      ),
    );
  }
}

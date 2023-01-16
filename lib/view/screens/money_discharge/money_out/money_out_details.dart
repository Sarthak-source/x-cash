import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/data/controller/money_discharge/money_out/money_out_controller.dart';
import 'package:xcash_app/data/repo/money_discharge/money_out/money_out_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/widget/money_out_form.dart';

class MoneyOutDetails extends StatefulWidget {
  const MoneyOutDetails({Key? key}) : super(key: key);

  @override
  State<MoneyOutDetails> createState() => _MoneyOutDetailsState();
}

class _MoneyOutDetailsState extends State<MoneyOutDetails> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(MoneyOutRepo(apiClient: Get.find()));
    final controller = Get.put(MoneyOutController(moneyOutRepo: Get.find()));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomSheetHeaderText(text: MyStrings.moneyOutDetail),
            BottomSheetCloseButton()
          ],
        ),
        const CustomDivider(space: Dimensions.space15),
        const MoneyOutForm()
      ],
    );
  }
}


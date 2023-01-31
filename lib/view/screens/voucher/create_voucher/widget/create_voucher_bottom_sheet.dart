import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/voucher/create_voucher_controller.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class CreateVoucherBottomSheet extends StatelessWidget {
  const CreateVoucherBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVoucherController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BottomSheetHeaderText(text: MyStrings.paymentPreview),
                BottomSheetCloseButton()
              ],
            ),
            const CustomDivider(space: Dimensions.space15),
            controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                text: MyStrings.confirm,
                press: (){
                  controller.submitCreateVoucher();
                }
            )
          ],
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_method/widget/withdraw_method_form.dart';

class WithdrawMethod extends StatelessWidget {
  const WithdrawMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const[
            BottomSheetHeaderText(text: MyStrings.addWithdrawMethod),
            BottomSheetCloseButton()
          ],
        ),

        const CustomDivider(space: Dimensions.space15),

        const WithdrawMethodForm()
      ],
    );
  }
}

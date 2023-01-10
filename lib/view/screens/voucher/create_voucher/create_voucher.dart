import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/widget/create_voucher_form.dart';

class CreateVoucher extends StatefulWidget {
  const CreateVoucher({Key? key}) : super(key: key);

  @override
  State<CreateVoucher> createState() => _CreateVoucherState();
}

class _CreateVoucherState extends State<CreateVoucher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomSheetHeaderText(text: MyStrings.provideDetails),
            BottomSheetCloseButton()
          ],
        ),

        const CustomDivider(),

        const CreateVoucherForm()
      ],
    );
  }
}

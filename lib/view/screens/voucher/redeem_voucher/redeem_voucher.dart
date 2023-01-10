import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';

import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class RedeemVoucher extends StatefulWidget {
  const RedeemVoucher({Key? key}) : super(key: key);

  @override
  State<RedeemVoucher> createState() => _RedeemVoucherState();
}

class _RedeemVoucherState extends State<RedeemVoucher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomSheetHeaderText(text: MyStrings.RedeemVoucher),
            BottomSheetCloseButton()
          ],
        ),

        const CustomDivider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedButton(
                press: (){},
                text: '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(MyImages.email, color: MyColor.colorWhite, height: 16, width: 16),
                    const SizedBox(width: Dimensions.space10),
                    Text("colorRedeem Log", style: regularSmall.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500))
                  ],
                ),
            )
          ],
        ),

        const SizedBox(height: Dimensions.space20),

        CustomAmountTextField(
            labelText: MyStrings.voucherNumber,
            hintText: "Enter ${MyStrings.voucherNumber.toLowerCase()}",
            onChanged: (value){},
            currency: '',
        ),

        const SizedBox(height: Dimensions.space25),

        RoundedButton(
            press: (){},
            text:MyStrings.colorRedeem
        )
      ],
    );
  }
}

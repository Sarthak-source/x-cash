import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
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
            BottomSheetHeaderText(text: MyStrings.redeemVoucher),
            BottomSheetCloseButton()
          ],
        ),

        const CustomDivider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomAnimatedButton(
                onTap: (){},
                height: 45,
                width: 120,
                backgroundColor: MyColor.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(MyImages.email, color: MyColor.colorWhite, height: 16, width: 16),
                    const SizedBox(width: Dimensions.space10),
                    Text("Redeem Log", style: interRegularSmall.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500))
                  ],
                ),
            )
          ],
        ),

        const SizedBox(height: Dimensions.space20),

        CustomAmountTextField(
            labelText: MyStrings.voucherNumber,
            hintText: "Enter ${MyStrings.voucherNumber.toLowerCase()}",
            onChanged: (value){}
        ),

        const SizedBox(height: Dimensions.space25),

        CustomAnimatedButton(
            onTap: (){},
            height: 45,
            width: MediaQuery.of(context).size.width,
            backgroundColor: MyColor.primaryColor,
            child: Text(MyStrings.redeem, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}

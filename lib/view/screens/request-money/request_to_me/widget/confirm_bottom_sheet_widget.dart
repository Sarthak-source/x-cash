import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_label_text.dart';

class ConfirmBottomSheetWidget extends StatefulWidget {
  const ConfirmBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ConfirmBottomSheetWidget> createState() => _ConfirmBottomSheetWidgetState();
}

class _ConfirmBottomSheetWidgetState extends State<ConfirmBottomSheetWidget> {

  var selectOtp = "Select OTP Type";
  List<String> otpItems = ["Select OTP Type", "Email", "Sms"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomSheetHeaderText(text: "Are you sure want to confirm?"),
            BottomSheetCloseButton()
          ],
        ),
        const SizedBox(height: Dimensions.space5),

        const BottomSheetLabelText(text: "400 IDR will be reduced from\nyour IDR wallet."),

        const SizedBox(height: Dimensions.space15),

        CustomDropDownTextField(
            labelText: MyStrings.selectOtp,
            hintText: selectOtp,
            selectedValue: selectOtp,
            onChanged: (value){
              setState(() {
                selectOtp = value.toString();
              });
            },
            items: otpItems.map((String val){
              return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                    style: interRegularSmall,
                  )
              );
            }).toList()
        ),

        const SizedBox(height: Dimensions.space20),

        CustomAnimatedButton(
          onTap: (){},
          height: 45,
          width: MediaQuery.of(context).size.width,
          backgroundColor: MyColor.primaryColor,
          child: Text("Continue", textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}

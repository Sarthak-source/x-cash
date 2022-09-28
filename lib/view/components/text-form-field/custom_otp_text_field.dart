import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class CustomOTPTextField extends StatelessWidget {


  final TextEditingController? textEditingController;
  final Function onChanged;
  const CustomOTPTextField({

    Key? key,
    this.textEditingController,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style: interRegularDefault,
      controller: textEditingController,
      cursorColor: MyColor.primaryColor,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: (value) => onChanged(value),
      inputFormatters: [

        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: const InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide(color: MyColor.lineColor, width: 2)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyColor.primaryColor, width: 2)),
      ),
    );
  }
}

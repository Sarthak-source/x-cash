import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class CustomDropDownTextField extends StatefulWidget {

  final Object selectedValue;
  final String labelText, hintText;
  Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;

  CustomDropDownTextField({

    Key? key,

    required this.labelText,
    required this.hintText,
    required this.selectedValue,
    required this.onChanged,
    required this.items
  }) : super(key: key);

  @override
  State<CustomDropDownTextField> createState() => _CustomDropDownTextFieldState();
}

class _CustomDropDownTextFieldState extends State<CustomDropDownTextField> {

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(

          widget.labelText,
          style: interRegularSmall,
        ),
        const SizedBox(height: 5),

        DropdownButtonFormField(

          value: widget.selectedValue,
          dropdownColor: MyColor.colorWhite,
          focusColor: MyColor.colorWhite,
          style: interRegularSmall,
          decoration: InputDecoration(

            hintText: widget.hintText,
            filled: true,
            fillColor: MyColor.primaryColor100,
            hintStyle: interRegularSmall.copyWith(fontSize: 14, color: MyColor.primarySubTextColor),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
          ),
          isExpanded: false,
          onChanged: widget.onChanged,
          items: widget.items
        )
      ],
    );
  }
}

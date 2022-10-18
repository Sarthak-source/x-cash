import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class CustomAmountTextField extends StatefulWidget {

  CustomAmountTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.autoFocus = false,
    required this.onChanged,
    this.textEditingController
  }) : super(key: key);

  final String labelText;
  final String hintText;
  bool autoFocus;
  final Function(String) onChanged;
  final TextEditingController? textEditingController;

  @override
  State<CustomAmountTextField> createState() => _CustomAmountTextFieldState();
}

class _CustomAmountTextFieldState extends State<CustomAmountTextField> {

  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: interRegularDefault.copyWith(height: 1.452)),

        const SizedBox(height: Dimensions.space10),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: Dimensions.space20, right: Dimensions.space10 / 2, top: Dimensions.space10 / 2, bottom: Dimensions.space10 / 2),
          decoration: BoxDecoration(
            color: MyColor.colorWhite,
            border: Border.all(color: isFocus ? MyColor.primaryColor : MyColor.textFieldBorderColor, width: 1.00),
            borderRadius: BorderRadius.circular(3)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: TextField(
                  controller: widget.textEditingController,
                  autofocus: widget.autoFocus,
                  style: interRegularSmall,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  onTap: (){
                      setState(() {
                        isFocus = true;
                      });
                  },
                  onChanged: (value){},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 12),
                    hintText: widget.hintText,
                    hintStyle: interRegularSmall.copyWith(color: MyColor.primarySubTextColor, height: 1.452),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                color: MyColor.primaryColor.withOpacity(0.06),
                alignment: Alignment.center,
                child: Text(MyStrings.currency, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ],
    );
  }
}

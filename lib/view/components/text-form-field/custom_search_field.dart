import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class CustomSearchField extends StatefulWidget {

  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final bool showLabelText;
  final VoidCallback onPressed;
  final TextEditingController? textEditingController;
  const CustomSearchField({
    Key? key,
    this.textEditingController,
    this.labelText = "",
    required this.hintText,
    required this.onChanged,
    this.showLabelText = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {

  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabelText ? Text(widget.labelText.tr, style: regularDefault.copyWith(height: 1.452)) : const SizedBox(),

        widget.showLabelText ? const SizedBox(height: Dimensions.space10) : const SizedBox(),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: Dimensions.space20, right: Dimensions.space20, top: Dimensions.space10 / 2, bottom: Dimensions.space10 / 2),
          decoration: BoxDecoration(
              color: MyColor.colorWhite,
              border: Border.all(color: isFocus ? MyColor.primaryColor : MyColor.colorWhite, width: 1.00),
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
                  style: regularSmall,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  onChanged: widget.onChanged,
                  onTap: (){
                    setState(() {
                      isFocus = true;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 12),
                      hintText: widget.hintText.tr,
                      hintStyle: regularSmall.copyWith(color: MyColor.contentTextColor, height: 1.452),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onPressed,
                child: const Icon(Icons.search, color: MyColor.colorGrey, size: 20),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import '../../../../core/utils/my_color.dart';

class CustomTextFormField extends StatefulWidget {

  final String hintText, labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isSuffix;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final VoidCallback? onTap;
  final Function onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool isSearch;
  final VoidCallback? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final String? errorText;


  const CustomTextFormField(
      {Key? key,
        required this.labelText,
        required this.hintText,
        this.controller,
        this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.onSuffixTap,
        this.validator,
        this.fillColor=MyColor.colorWhite,
        this.onSubmit,
        required this.onChanged,
        this.capitalization = TextCapitalization.none,
        this.isCountryPicker = false,
        this.isShowBorder = false,
        this.isShowSuffixIcon = false,
        this.isShowPrefixIcon = false,
        this.onTap,
        this.isSuffix = false,
        this.isIcon = false,
        this.isPassword = false,
        this.suffixIconUrl,
        this.prefixIconUrl,
        this.errorText,
        this.isSearch = false,}) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SmallText(text: widget.labelText, fontSize: Dimensions.fontDefault),
        const SizedBox(height: Dimensions.space10),

        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: interRegularDefault.copyWith(color: MyColor.primaryTextColor),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: MyColor.primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          validator:widget.validator,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.primaryColor, width: 1),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: const BorderSide(color: MyColor.textFieldBorderColor, width: 1),
            ),
            suffix: widget.isSuffix ? Container(

              width: 50,
              color: const Color(0xffE0F0FD), alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: Text("USD", style: interRegularSmall.copyWith(color: MyColor.primaryColor)),
            ) : const SizedBox(),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            hintStyle: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
            filled: true,
            prefixIcon: widget.isShowPrefixIcon ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              // child: Image.asset(widget.prefixIconUrl),
              child: Image.asset(""),
            ) : const SizedBox.shrink(),
            prefixIconConstraints:const  BoxConstraints(minWidth: 23, maxHeight: 20),
            suffixIcon: widget.isShowSuffixIcon
                ? widget.isPassword
                ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: MyColor.primarySubTextColor),
                onPressed: _toggle)
                : widget.isIcon
                ? IconButton(
              onPressed: widget.onSuffixTap,
              icon:  Icon(
                widget.isSearch?Icons.search_outlined:widget.isCountryPicker?Icons.arrow_drop_down_outlined:Icons.camera_alt_outlined,
                size: 25,
                color: MyColor.primaryColor,
              ),
            )
                : null
                : null,
          ),
          onTap: widget.onTap,
          onFieldSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!() : null,
          onChanged: (text)=> widget.onChanged(text),
        )
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class AnotherCustomTextField extends StatefulWidget {

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
  final VoidCallback? onTap;


  const AnotherCustomTextField(
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
        this.onTap,
        this.validator,
        this.fillColor = MyColor.colorWhite,
        this.onSubmit,
        required this.onChanged,
        this.capitalization = TextCapitalization.none,
        this.isCountryPicker = false,
        this.isShowBorder = false,
        this.isShowSuffixIcon = false,
        this.isShowPrefixIcon = false,
        this.isSuffix = false,
        this.isIcon = false,
        this.isPassword = false,
        this.suffixIconUrl,
        this.prefixIconUrl,
        this.errorText,
        this.isSearch = false,}) : super(key: key);

  @override
  _AnotherCustomTextFieldState createState() => _AnotherCustomTextFieldState();
}

class _AnotherCustomTextFieldState extends State<AnotherCustomTextField> {
  bool _obscureText = true;
  bool isFocused = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: interRegularDefault.copyWith(color: MyColor.colorBlack),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: MyColor.primaryColor,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      validator:widget.validator,
      autofocus: false,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: interRegularSmall.copyWith(color: MyColor.colorBlack),
        filled: true,
        fillColor: MyColor.colorWhite,
        hintStyle: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
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
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        suffix: widget.isSuffix ? Container(

          width: 50,
          color: const Color(0xffE0F0FD), alignment: Alignment.center,
          padding: const EdgeInsets.all(Dimensions.space10 / 2),
          child: Text("USD", style: interRegularSmall.copyWith(color: MyColor.primaryColor)),
        ) : const SizedBox(),
        isDense: true,
        prefixIcon: widget.isShowPrefixIcon ? Padding(
          padding: const EdgeInsets.only(left: Dimensions.space20, right: Dimensions.space10 / 2),
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
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
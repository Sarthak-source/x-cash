
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcash_app/core/utils/styles.dart';
import '../../../../core/utils/my_color.dart';



class CustomTextFieldForPhone extends StatefulWidget {
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
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final VoidCallback? onTap;
  final Function onChanged;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool isSearch;
  final VoidCallback? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;

  const CustomTextFieldForPhone(
      {Key? key, this.hintText = 'Write something...',
        required this.labelText,
        this.controller,
        this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.onSuffixTap,
        this.fillColor=MyColor.primaryColor100,
        this.onSubmit,
        required this.onChanged,
        this.capitalization = TextCapitalization.none,
        this.isCountryPicker = false,
        this.isShowBorder = false,
        this.isShowSuffixIcon = false,
        this.isShowPrefixIcon = false,
        this.onTap,
        this.isIcon = false,
        this.isPassword = false,
        this.suffixIconUrl,
        this.prefixIconUrl,
        this.isSearch = false,}) : super(key: key);

  @override
  _CustomTextFieldForPhoneState createState() => _CustomTextFieldForPhoneState();
}

class _CustomTextFieldForPhoneState extends State<CustomTextFieldForPhone> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(widget.labelText, style: interRegularSmall),
        const SizedBox(height:5),

        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: interRegularDefault,
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))] : null,
          decoration: InputDecoration(
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
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            hintStyle: interRegularSmall.copyWith(color: MyColor.primarySubTextColor),
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
              icon: const Icon(
                Icons.expand_more_outlined,
                size: 25,
              ),/*Image.asset(
                widget.suffixIconUrl!=null?widget.suffixIconUrl!:"",
                width: 25,
                height: 25,
              ),*/
            )
                : null
                : null,
          ),
          onTap: widget.onTap,
          onFieldSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!() : null,
          onChanged: (text)=> widget.onChanged(text),
        ),
      ],
    );
  }

  void _toggle() {

    setState(() {
      _obscureText = !_obscureText;
    });

  }
}

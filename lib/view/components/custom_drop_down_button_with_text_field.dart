import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';



class CustomDropDownWithTextField extends StatefulWidget {

  final String? title, selectedValue;
  final List<String>? list;
  final ValueChanged? onChanged;

  const CustomDropDownWithTextField({Key? key,
    this.title,
    this.selectedValue,
    this.list,
    this.onChanged, }) : super(key: key);

  @override
  State<CustomDropDownWithTextField> createState() => _CustomDropDownWithTextFieldState();
}

class _CustomDropDownWithTextFieldState extends State<CustomDropDownWithTextField> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    widget.list?.removeWhere((element) => element.isEmpty);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:45,
          decoration: BoxDecoration(
              color: MyColor.colorWhite,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: MyColor.screenBgColor)
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left:10,
                right: 5,
                top: 5,
                bottom: 5
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: Container(),
              hint: Text(
                widget.selectedValue??'',
                style: regularDefault.copyWith(color: MyColor.colorBlack),
              ), // Not necessary for Option 1
              value: widget.selectedValue,
              dropdownColor: MyColor.colorWhite,
              onChanged: widget.onChanged,
              items: widget.list!.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: regularDefault.copyWith(color: MyColor.colorBlack),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

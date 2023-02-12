import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';

class FilterRowWidget extends StatefulWidget {
  final String text;
  final bool fromTrx;
  final Color iconColor;
  final Callback press;
  final bool isFilterBtn;
  final Color bgColor;
  final Color borderColor;
  const FilterRowWidget({
    Key? key,
    this.bgColor = MyColor.transparentColor,
    this.isFilterBtn=false,
    this.iconColor = MyColor.primaryColor,
    this.borderColor = MyColor.textFieldDisableBorderColor,
    required this.text,
    required this.press,
    this.fromTrx=false
  }) : super(key: key);

  @override
  State<FilterRowWidget> createState() => _FilterRowWidgetState();
}

class _FilterRowWidgetState extends State<FilterRowWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.press,
      child: Container(
        height: 47,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
            color: widget.isFilterBtn ? MyColor.primaryColor : widget.bgColor,
            border: Border.all(color: widget.borderColor, width: widget.isFilterBtn ? 0 : 0.5)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            widget.fromTrx ? Expanded(child: Text(widget.text,style: regularDefault.copyWith(overflow: TextOverflow.ellipsis,color: widget.isFilterBtn ? MyColor.colorBlack : MyColor.colorBlack))): Expanded(child: Text(widget.text,style: regularDefault.copyWith(color:MyColor.colorBlack,overflow: TextOverflow.ellipsis),)),
            const SizedBox(width: 20,),
            Icon(Icons.arrow_drop_down, color: widget.iconColor)
          ],
        ),
      ),
    );
  }
}

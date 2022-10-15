import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/text/app_bar_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String title;
  final Color backgroundColor;
  final Widget? leading;
  bool isShowLeading;
  final double elevation;
  final Widget? flexibleSpace;
  final ShapeBorder? shape;
  final List<Widget>? actions;
  CustomAppBar({
    Key? key,
    this.title = "",
    this.backgroundColor = MyColor.colorWhite,
    this.leading,
    this.isShowLeading = false,
    this.elevation = 5,
    this.flexibleSpace,
    this.shape,
    this.actions
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: widget.elevation,
      leading: widget.isShowLeading ? widget.leading : const SizedBox(),
      title: AppBarTitle(text: widget.title),
      automaticallyImplyLeading: widget.isShowLeading,
      flexibleSpace: widget.flexibleSpace,
      shape: widget.shape,
      actions: widget.actions,
    );
  }
}

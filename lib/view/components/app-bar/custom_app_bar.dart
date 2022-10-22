import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/text/app_bar_title.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String title;
  final Color backgroundColor;
  final Widget? leading;
  bool showBackIcon;
  final double elevation;
  final ShapeBorder? shape;
  final List<Widget>? actions;
  final VoidCallback changeRoute;
  final Color iconColor;
  final Color textColor;
  final Widget? flexibleSpace;
  CustomAppBar({
    Key? key,
    this.title = "",
    this.backgroundColor = MyColor.colorWhite,
    this.leading,
    this.showBackIcon = false,
    this.elevation = 0,
    this.shape,
    this.actions,
    this.iconColor = MyColor.primaryColor,
    this.textColor = MyColor.colorBlack,
    required this.changeRoute,
    this.flexibleSpace
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return widget.showBackIcon ? AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      leading: IconButton(
        onPressed: widget.changeRoute,
        icon: Icon(Icons.arrow_back, color: widget.iconColor, size: 20),
      ),
      title: AppBarTitle(text: widget.title, textColor: widget.textColor),
      automaticallyImplyLeading: false,
      shape: widget.shape,
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
    ) : AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      title: AppBarTitle(text: widget.title, textColor: widget.textColor),
      automaticallyImplyLeading: false,
      shape: widget.shape,
      actions: widget.actions,
      flexibleSpace: widget.flexibleSpace,
    );
  }
}

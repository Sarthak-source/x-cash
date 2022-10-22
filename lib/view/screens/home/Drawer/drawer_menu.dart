import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/home/Drawer/widget/drawer_items.dart';
import 'package:xcash_app/view/screens/home/Drawer/widget/drawer_top.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColor.colorWhite,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DrawerTop(),

            CustomDivider(),

            DrawerItems()
          ],
        ),
      ),
    );
  }
}

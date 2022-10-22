import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/text/notification_count_text.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          padding: const EdgeInsets.all(Dimensions.space10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color(0xff9283fd),
              shape: BoxShape.circle
          ),
          child: SvgPicture.asset(MyImages.menu, color: MyColor.colorWhite, height: 16, width: 16),
        )
    );
  }
}

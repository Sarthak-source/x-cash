import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/text/notification_count_text.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({Key? key}) : super(key: key);

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.space10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xff9283fd),
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(MyImages.bell, color: MyColor.colorWhite, height: 16, width: 16),
            ),
            Positioned(
              right: 0,
              top: 2,
              child: Container(
                height: 12, width: 12,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                ),
                child:  const NotificationCountText(text: "5"),
              ),
            ),
          ]
        )
    );
  }
}

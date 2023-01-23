import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';

class MyRequestListItem extends StatelessWidget {

  final String name;
  final String date;
  final String amount;

  const MyRequestListItem({
    Key? key,
    required this.name,
    required this.date,
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
      decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: regularDefault.copyWith(fontWeight: FontWeight.w500)
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                    height: 24, width: 24,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: MyColor.secondaryScreenBgColor,
                        shape: BoxShape.circle
                    ),
                    child: SvgPicture.asset(MyImages.dotMenu, height: 12, width: 12)
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  date,
                  style: regularSmall.copyWith(color: MyColor.contentTextColor)
              ),
              Text(
                  amount,
                  style: regularLarge.copyWith(fontWeight: FontWeight.w600)
              )
            ],
          ),
        ],
      ),
    );
  }
}

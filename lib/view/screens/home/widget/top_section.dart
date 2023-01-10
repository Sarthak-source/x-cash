import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/screens/home/widget/menu_section.dart';
import 'package:xcash_app/view/screens/home/widget/notification_section.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  String myBalance = "\$999,999,960.00";

  bool _isAnimated = false;
  bool isBalanceShown = false;
  bool isBalance = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45, width: 45,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(MyImages.userProfile), fit: BoxFit.fill)
                ),
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("William Anne", style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
                  const SizedBox(height: Dimensions.space10),
                  InkWell(
                      onTap: changeState,
                      child: Container(
                          width: 160,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedOpacity(
                                    opacity: isBalanceShown ? 1 : 0,
                                    duration: const Duration(milliseconds: 500),
                                    child: Text(myBalance, style: regularSmall.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w600))
                                ),

                                AnimatedOpacity(
                                    opacity: isBalance ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Text(MyStrings.tapForBalance, style: regularSmall.copyWith(fontWeight: FontWeight.w500))
                                ),

                                AnimatedPositioned(
                                    duration: const Duration(milliseconds: 1100),
                                    left: _isAnimated == false ? 5 : 135,
                                    curve: Curves.fastOutSlowIn,
                                    child: FittedBox(
                                      child: Container(
                                        height: 20, width: 20,
                                        padding: const EdgeInsets.all(Dimensions.space10 / 5),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
                                        child: Icon(_isAnimated == true ? Icons.visibility : Icons.visibility_off, color: MyColor.colorWhite, size: 10),
                                      ),
                                    )
                                )
                              ]
                          )
                      )
                  ),
                ],
              )
            ],
          ),

          Row(
            children: const [
              NotificationSection(),
              SizedBox(width: Dimensions.space10),
              MenuSection()
            ],
          )
        ],
      ),
    );
  }

  void changeState() async {
    _isAnimated = true;
    isBalance = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 800),
            () => setState(() => isBalanceShown = true)
    );
    await Future.delayed(const Duration(seconds: 3),
            () => setState(() => isBalanceShown = false)
    );
    await Future.delayed(const Duration(milliseconds: 200),
            () => setState(() => _isAnimated = false));
    await Future.delayed(const Duration(milliseconds: 800),
            () => setState(() => isBalance = true)
    );
  }
}

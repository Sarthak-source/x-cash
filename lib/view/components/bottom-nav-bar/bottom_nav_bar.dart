import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/screens/activity/activity_screen.dart';
import 'package:xcash_app/view/screens/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {

  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screens = [
    const HomeScreen(),
    const ActivityScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: MyColor.colorWhite,
              boxShadow: [
                BoxShadow(color: Color.fromARGB(25, 0, 0, 0), offset: Offset(-2, -2), blurRadius: 2)
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              navBarItem(MyImages.home, 0, "Home"),
              navBarItem(MyImages.activity, 1, "Activity"),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65, width: 65,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: MyColor.primaryColor100,
          shape: BoxShape.circle
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(Dimensions.space10),
          decoration: const BoxDecoration(color: MyColor.primaryColor, shape: BoxShape.circle),
          child: SvgPicture.asset(MyImages.scan, color: MyColor.primaryColor100, width: 30, height: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  navBarItem(String imagePath, int index, String label) {

    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(Dimensions.space5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: index == currentIndex ? MyColor.primaryColor100 : Colors.grey.withOpacity(0.2),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(
              imagePath, color: index == currentIndex ? MyColor.primaryColor : MyColor.iconColor,
              width: 20, height: 20,
            ),
          ),
          const SizedBox(height: Dimensions.space10 / 2),
          Text(
              label, textAlign: TextAlign.center,
              style: interRegularSmall.copyWith(color: index == currentIndex ? MyColor.primaryColor : MyColor.primaryTextColor)
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/widget/to_me_list.dart';

class RequestToMeScreen extends StatefulWidget {
  const RequestToMeScreen({Key? key}) : super(key: key);

  @override
  State<RequestToMeScreen> createState() => _RequestToMeScreenState();
}

class _RequestToMeScreenState extends State<RequestToMeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          title: "Money Request",
         /* actions: [
            Padding(
              padding: const EdgeInsets.only(right: Dimensions.space15),
              child: GestureDetector(
                onTap: (){
                  CustomBottomSheet(
                    child: const RequestMoney()
                  ).customBottomSheet(context);
                },
                child: Container(
                  height: 25, width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColor.colorWhite, border: Border.all(color: MyColor.primaryColor, width: 1.5),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.add, color: MyColor.primaryColor, size: 15),
                ),
              ),
            )
          ],
          changeRoute: () => Get.back(),*/
        ),

        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    middleButtons("My Request", 0),
                    middleButtons("To Me", 1),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Dimensions.space20),

            selectedIndex == 0 ? const SizedBox() : const Expanded(child: ToMeList()),
          ],
        ),
      ),
    );
  }

  middleButtons(String buttonName, int index) {
    return Expanded(
      child: GestureDetector(
          onTap: (){
            setState(() {
              selectedIndex = index;
            });
          },
          child: index == selectedIndex ? Container(

            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10),
            decoration: BoxDecoration(

                color: index == selectedIndex ? MyColor.primaryColor : MyColor.primaryColor,
                borderRadius: index == 0 ? const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)) :
                const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Text(buttonName, textAlign: TextAlign.center, style: regularSmall.copyWith(color: index == selectedIndex ? MyColor.colorWhite : MyColor.primaryColor)),
          ) : Container(

            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10 / 2, horizontal: Dimensions.space10),
            decoration: BoxDecoration(

                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(buttonName, textAlign: TextAlign.center, style: regularSmall.copyWith(color: MyColor.primaryColor)),
          )
      ),
    );
  }
}

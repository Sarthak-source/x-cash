import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Map<String, String>> data = [
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"},
    {"type" : "Update to our privacy policy", "date" : "Sep 12, 2022", "time" : "6.00 am"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          backgroundColor: MyColor.colorWhite,
          title: "Notification",
          changeRoute: () => Get.back(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
          physics: const ClampingScrollPhysics(),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => CustomCard(
                paddingTop: Dimensions.space15,
                paddingBottom: Dimensions.space15,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    CircleShapeImage(isSvgImage: true, image: MyImages.bell),
                    const SizedBox(width: Dimensions.space10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data[index]["type"]}", style: interRegularDefault.copyWith(fontWeight: FontWeight.w500)),
                        const SizedBox(height: Dimensions.space5),
                        Text("${data[index]["date"]} - ${data[index]["time"]}", style: interRegularSmall.copyWith(color: MyColor.primarySubTextColor, fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}

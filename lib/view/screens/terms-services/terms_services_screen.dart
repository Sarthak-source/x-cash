import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';


class TermsServicesScreen extends StatefulWidget {

  const TermsServicesScreen({Key? key}) : super(key: key);

  @override
  State<TermsServicesScreen> createState() => _TermsServicesScreenState();
}

class _TermsServicesScreenState extends State<TermsServicesScreen> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          title: MyStrings.termsOfServices,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(MyStrings.ownership, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.support, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.warranty, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.unauthorized, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.payment, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.couponPolicy, style: regularLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altecolorRed or unmodified. All item apropertwe created them. Our items are given",
                  style: regularDefault.copyWith(color: MyColor.contentTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

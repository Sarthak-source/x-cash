import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';

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
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          backgroundColor: MyColor.colorWhite,
          title: MyStrings.termsOfServices,
          changeRoute: () => Get.back(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(MyStrings.ownership, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.support, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.warranty, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.unauthorized, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.payment, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
                const SizedBox(height: Dimensions.space15),
                Text(MyStrings.couponPolicy, style: interRegularDefaultLarge.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: Dimensions.space10 / 2),
                Text(
                  "You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All item apropertwe created them. Our items are given",
                  style: interRegularDefault.copyWith(color: MyColor.primarySubTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

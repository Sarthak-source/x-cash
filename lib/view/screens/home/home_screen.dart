import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/data/repo/home/home_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/screens/home/widget/insight_section.dart';
import 'package:xcash_app/view/screens/home/widget/latest_transaction_section.dart';
import 'package:xcash_app/view/screens/home/widget/main_item_section.dart';
import 'package:xcash_app/view/screens/home/widget/quick_link_section.dart';
import 'package:xcash_app/view/screens/home/widget/top_section.dart';
import 'package:xcash_app/view/screens/home/widget/wallet_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    final controller = Get.put(HomeController(homeRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: Dimensions.space20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopSection(),
                MainItemSection(),
                SizedBox(height: Dimensions.space10),
                WalletSection(),
                SizedBox(height: Dimensions.space10),
                QuickLinkSection(),
                SizedBox(height: Dimensions.space10),
                InsightSection(),
                SizedBox(height: Dimensions.space10),
                LatestTransactionSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

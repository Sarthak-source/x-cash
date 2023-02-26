import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/home/home_controller.dart';
import 'package:xcash_app/data/controller/qr_code/qr_code_controller.dart';
import 'package:xcash_app/data/repo/home/home_repo.dart';
import 'package:xcash_app/data/repo/qr_code/qr_code_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';

class MyQrCodeScreen extends StatefulWidget {
  const MyQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();
}

class _MyQrCodeScreenState extends State<MyQrCodeScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    Get.put(QrCodeRepo(apiClient: Get.find()));
    Get.put(HomeController(homeRepo: Get.find()));
    final controller = Get.put(QrCodeController(qrCodeRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
      Get.find<HomeController>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrCodeController>(
      builder: (controller) => GetBuilder<HomeController>(
        builder: (homeController) => SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.primaryColor,
            appBar: CustomAppBar(
              bgColor: MyColor.primaryColor,
              title: MyStrings.myQrCode.tr,
              isShowBackBtn: true,
            ),
            body: controller.isLoading ? const CustomLoader(loaderColor: MyColor.colorWhite) : SingleChildScrollView(
              padding: Dimensions.screenPaddingHV,
              child: Hero(
                tag: "qr_code",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60, width: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(MyImages.profile), fit: BoxFit.fill)
                      ),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          homeController.username,
                          style: semiBoldExtraLarge.copyWith(color: MyColor.colorWhite),
                        ),
                        const SizedBox(width: Dimensions.space8),
                        const Icon(Icons.verified, color: MyColor.colorWhite, size: 20)
                      ],
                    ),
                    const SizedBox(height: Dimensions.textToTextSpace),
                    Text(
                      MyStrings.verifiedUser.tr,
                      style: semiBoldLarge.copyWith(color: MyColor.colorWhite.withOpacity(0.5)),
                    ),
                    const SizedBox(height: Dimensions.space30),
                    Image.network(
                        controller.qrCode,
                        width: 220, height: 220
                    ),
                    const SizedBox(height: Dimensions.space30),
                    SizedBox(
                      width: 240,
                      child: RoundedButton(
                          color: MyColor.colorWhite,
                          text: MyStrings.downloadAsImage,
                          textColor: MyColor.primaryColor,
                          press: (){}
                      ),
                    ),
                    const SizedBox(height: Dimensions.space15)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_method_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_method_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

class WithdrawMethodScreen extends StatefulWidget {
  const WithdrawMethodScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMethodScreen> createState() => _WithdrawMethodScreenState();
}

class _WithdrawMethodScreenState extends State<WithdrawMethodScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(Get.find<WithdrawMethodController>().hasNext()){
        Get.find<WithdrawMethodController>().loadData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawMethodRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawMethodController(withdrawMethodRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMethodController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: const CustomAppBar(title: MyStrings.withdrawMethod),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            physics: const BouncingScrollPhysics(),
            child: controller.methodList.isEmpty ? const Center(
              child: NoDataOrInternetScreen(),
            ) : ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.methodList.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index){
                  if (controller.methodList.length == index) {
                    return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                  }

                  return index == 0 ? CustomCard(
                    paddingTop: Dimensions.space15,
                    paddingBottom: Dimensions.space15,
                    radius: Dimensions.defaultRadius,
                    isPress: true,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: 50, width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: MyColor.getPrimaryColor().withOpacity(0.2), shape: BoxShape.circle),
                          child: Image.asset(MyImages.addNewMethod, color: MyColor.getPrimaryColor(), height: 25, width: 25),
                        ),
                        const SizedBox(width: Dimensions.space15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.methodList[index].name ?? "",
                              style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: Dimensions.space8),
                            Text(
                              MyStrings.chooseNewWithdrawMethod,
                              style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPressed: (){
                      Get.toNamed(RouteHelper.addWithdrawMethodScreen);
                    },
                  ) : CustomCard(
                    paddingTop: Dimensions.space15,
                    paddingBottom: Dimensions.space15,
                    radius: Dimensions.defaultRadius,
                    isPress: true,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 35, width: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: MyColor.getPrimaryColor().withOpacity(0.2), shape: BoxShape.circle),
                                  child: Image.asset(MyImages.withdrawMoney, color: MyColor.getPrimaryColor(), height: 17, width: 17),
                                ),
                                const SizedBox(width: Dimensions.space15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.methodList[index].name ?? "",
                                        style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                    ),
                                    const SizedBox(height: Dimensions.space5),
                                    Text(
                                        "${controller.methodList[index].withdrawMethod?.name ?? ""} - ${controller.methodList[index].currency?.currencyCode ?? ""}",
                                        style: regularSmall.copyWith(color: MyColor.getPrimaryColor())
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                  ],
                                )
                              ],
                            ),
                            StatusWidget(
                                status: controller.getStatusOrColor(index),
                                color: controller.getStatusOrColor(index, isStatus: false)
                            )
                          ],
                        ),
                        const CustomDivider(space: Dimensions.space10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MyStrings.limit,
                                  style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                                ),
                                const SizedBox(height: Dimensions.space5),
                                Text(
                                    "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.withdrawMinLimit ?? "")} ~ "
                                        "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.withdrawMaxLimit ?? "")} "
                                        "${controller.methodList[index].currency?.currencyCode ?? ""}",
                                    style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                ),
                              ],
                            ),
                            const SizedBox(width: Dimensions.space10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  MyStrings.charge,
                                  style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.6)),
                                ),
                                const SizedBox(height: Dimensions.space5),
                                controller.methodList[index].withdrawMethod?.id == 4 ? Text(
                                    "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.withdrawMinLimit ?? "")} "
                                        "${controller.methodList[index].currency?.currencyCode ?? ""} + "
                                        "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.percentCharge ?? "")}%",
                                    style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                ) : Text(
                                    "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.withdrawMaxLimit ?? "")} "
                                        "${controller.methodList[index].currency?.currencyCode ?? ""} + "
                                        "${Converter.formatNumber(controller.methodList[index].withdrawMethod?.percentCharge ?? "")}%",
                                    style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    onPressed: (){
                      String id = controller.methodList[index].id.toString();
                      Get.toNamed(RouteHelper.editWithdrawMethod, arguments: id);
                    },
                  );
                }
            )
          ),
        ),
      ),
    );
  }
}

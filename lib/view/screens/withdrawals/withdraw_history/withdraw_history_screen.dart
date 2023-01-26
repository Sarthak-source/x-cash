import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/withdraw_log_card.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/withdraw_log_top.dart';

class WithdrawHistoryScreen extends StatefulWidget {
  const WithdrawHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawHistoryScreen> createState() => _WithdrawHistoryScreenState();
}

class _WithdrawHistoryScreenState extends State<WithdrawHistoryScreen> {
  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (Get.find<WithdrawHistoryController>().hasNext()) {
        Get.find<WithdrawHistoryController>().loadData();
      }
    }
  }

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawHistoryRepo(apiClient: Get.find()));
    final controller =
        Get.put(WithdrawHistoryController(withdrawHistoryRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawHistoryController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            title: Text(MyStrings.withdrawHistory,
                style: regularDefault.copyWith(
                    color: MyColor.getAppBarContentColor())),
            backgroundColor: MyColor.getAppBarColor(),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back,
                  size: 20, color: MyColor.getAppBarContentColor()),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.space15),
                child: InkWell(
                  onTap: () {
                    controller.changeSearchStatus();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: MyColor.colorWhite, shape: BoxShape.circle),
                    child: Icon(
                        controller.isSearch ? Icons.clear : Icons.search,
                        color: MyColor.primaryColor,
                        size: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.space15),
                child: InkWell(
                  onTap: () => Get.toNamed(RouteHelper.withdrawMoneyScreen),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: MyColor.colorWhite, shape: BoxShape.circle),
                    child: const Icon(Icons.add,
                        color: MyColor.primaryColor, size: 15),
                  ),
                ),
              )
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : Padding(
                  padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: controller.isSearch,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            WithdrawLogTop(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: controller.withdrawList.isEmpty && controller.filterLoading == false ? const Center(
                          child: NoDataOrInternetScreen(),
                        ) : controller.filterLoading ? const CustomLoader() : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          itemCount: controller.withdrawList.length + 1,
                          separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                          itemBuilder: (context, index) {
                            if (controller.withdrawList.length == index) {
                              return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                            }
                            return WithdrawLogCard(
                              index: index,
                              press: (){
                                CustomBottomSheet(
                                  child: controller.withdrawList[index].withdrawInformation == null ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          BottomSheetHeaderText(text: MyStrings.details),
                                          BottomSheetCloseButton()
                                        ],
                                      ),
                                      const CustomDivider(space: Dimensions.space10),
                                      Text(
                                        MyStrings.dataNotFound,
                                        style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ) : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                          BottomSheetHeaderText(text: MyStrings.details),
                                          BottomSheetCloseButton()
                                        ],
                                      ),
                                      const CustomDivider(space: Dimensions.space10),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.withdrawList[index].withdrawInformation?.length ?? 0,
                                        separatorBuilder: (context, infoIndex) => const SizedBox(height: Dimensions.space10),
                                        itemBuilder: (context, infoIndex) => Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.all(Dimensions.space10),
                                          decoration: BoxDecoration(
                                            color: MyColor.getCardBgColor(),
                                            border: Border.all(color: MyColor.colorBlack.withOpacity(0.6), width: 0.5),
                                            borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.withdrawList[index].withdrawInformation![infoIndex].name ?? "",
                                                style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                                              ),
                                              const SizedBox(height: Dimensions.space5),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
                                                child: Text(
                                                  Converter.removeQuotationAndSpecialCharacterFromString(controller.withdrawList[index].withdrawInformation![infoIndex].value!.toList().toString()),
                                                  style: regularSmall.copyWith(color: MyColor.getTextColor()),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ).customBottomSheet(context);
                              },
                            );
                        },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

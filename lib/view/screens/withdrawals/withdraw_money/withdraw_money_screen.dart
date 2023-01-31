import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_money_controller.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_money_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_bottom_sheet.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/widget/withdraw_money_status.dart';

class WithdrawMoneyScreen extends StatefulWidget {
  const WithdrawMoneyScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawMoneyScreen> createState() => _WithdrawMoneyScreenState();
}

class _WithdrawMoneyScreenState extends State<WithdrawMoneyScreen> {

  final ScrollController scrollController = ScrollController();
  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(Get.find<WithdrawMoneyController>().hasNext()){
        Get.find<WithdrawMoneyController>().loadData();
      }
    }
  }

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(WithdrawMoneyRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawMoneyController(withdrawMoneyRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMoneyController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(MyStrings.withdrawMoney, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
            backgroundColor: MyColor.getAppBarColor(),
            leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.space15),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.withdrawMethodScreen);
                  },
                  child: Container(
                    height: 30, width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: MyColor.colorWhite, shape: BoxShape.circle),
                    child: Icon(Icons.add, color: MyColor.getPrimaryColor(), size: 15),
                  ),
                ),
              )
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: Dimensions.screenPaddingHV,
            child: controller.withdrawMoneyList.isEmpty ? const Center(
              child: NoDataOrInternetScreen(),
            ) : ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.withdrawMoneyList.length + 1,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10 + 2),
                itemBuilder: (context, index){
                  if(controller.withdrawMoneyList.length == index){
                    return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                  }
                  return CustomCard(
                    paddingTop: Dimensions.space15,
                    paddingBottom: Dimensions.space15,
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
                                        controller.withdrawMoneyList[index].name ?? "",
                                        style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                    ),
                                    const SizedBox(height: Dimensions.space5),
                                    Text(
                                        "${controller.withdrawMoneyList[index].withdrawMethod?.name ?? ""} - ${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""}",
                                        style: regularSmall.copyWith(color: MyColor.getPrimaryColor())
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                  ],
                                )
                              ],
                            ),
                            WithdrawMoneyStatus(status: controller.withdrawMoneyList[index].withdrawMethod?.status ?? "")
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
                                    "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.withdrawMinLimit ?? "")} ~ "
                                        "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.withdrawMaxLimit ?? "")} "
                                        "${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""}",
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
                                controller.withdrawMoneyList[index].withdrawMethod?.id == 4 ? Text(
                                    "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.withdrawMinLimit ?? "")} "
                                        "${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""} + "
                                        "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.percentCharge ?? "")}%",
                                    style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                ) : Text(
                                    "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.withdrawMaxLimit ?? "")} "
                                        "${controller.withdrawMoneyList[index].currency?.currencyCode ?? ""} + "
                                        "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.withdrawMoneyList[index].withdrawMethod?.percentCharge ?? "")}%",
                                    style: regularSmall.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => WithdrawMoneyBottomSheet.bottomSheet(context, index: index)
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}

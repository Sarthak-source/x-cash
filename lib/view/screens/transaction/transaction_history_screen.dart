import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/date_converter.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';
import 'package:xcash_app/data/repo/transaction/transaction_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/screens/transaction/widget/filters_field.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (Get.find<TransactionHistoryController>().hasNext()) {
        Get.find<TransactionHistoryController>().loadTransactionData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(TransactionRepo(apiClient: Get.find()));
    final controller = Get.put(TransactionHistoryController(transactionRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialSelectedValue();
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
    return GetBuilder<TransactionHistoryController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            backgroundColor: MyColor.getAppBarColor(),
            elevation: 0,
            title: Text(MyStrings.transaction, style: regularLarge.copyWith(color: MyColor.getAppBarContentColor())),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.space15),
                child: GestureDetector(
                  onTap: (){
                    controller.changeSearchIcon();
                  },
                  child: Container(
                    height: 30, width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: MyColor.colorWhite, shape: BoxShape.circle),
                    child: controller.isSearch ? const Icon(
                        Icons.clear,
                        color: MyColor.primaryColor,
                        size: 15
                    ) : Image.asset(
                        MyImages.filter,
                        color: MyColor.primaryColor,
                        height: 15, width: 15
                    ),
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
                  child: const FiltersField(),
                ),
                Expanded(
                  child: controller.transactionList.isEmpty && controller.filterLoading == false ? const Center(
                    child: NoDataOrInternetScreen(),
                  ) : controller.filterLoading ? const CustomLoader() : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.transactionList.length + 1,
                        separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                        itemBuilder: (context, index) {
                          if(controller.transactionList.length == index){
                            return controller.hasNext() ? Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.all(5),
                                child: const CustomLoader()
                            ) : const SizedBox();
                          }

                          return  GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space10),
                                decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            height: 35, width: 35,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: controller.transactionList[index].trxType == "-" ? MyColor.colorRed.withOpacity(0.2) : MyColor.colorGreen.withOpacity(0.2),
                                                shape: BoxShape.circle
                                            ),
                                            child: Icon(
                                              controller.transactionList[index].trxType == "-" ? Icons.arrow_upward : Icons.arrow_downward,
                                              color: controller.transactionList[index].trxType == "-" ? MyColor.colorRed : MyColor.colorGreen,
                                              size: 20,
                                            )
                                        ),
                                        const SizedBox(width: Dimensions.space10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.transactionList[index].remark}".replaceAll("_", " ").toUpperCase(),
                                              style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(height: Dimensions.space10),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                controller.transactionList[index].details ?? "",
                                                style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateConverter.isoStringToLocalDateOnly(controller.transactionList[index].createdAt ?? ""),
                                          style: regularSmall.copyWith(color: MyColor.getTextColor().withOpacity(0.5)),
                                        ),
                                        const SizedBox(height: Dimensions.space10),
                                        Text(
                                            "${Converter.twoDecimalPlaceFixedWithoutRounding(controller.transactionList[index].amount ?? "")} ${controller.transactionList[index].currency?.currencyCode ?? ""}",
                                            style: regularDefault.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w600)
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                          );
                        }
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/transaction/transaction_history_controller.dart';
import 'package:xcash_app/data/repo/transaction/transaction_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_no_data_found_class.dart';
import 'package:xcash_app/view/components/no_data.dart';
import 'package:xcash_app/view/screens/transaction/widget/filters_field.dart';
import 'package:xcash_app/view/screens/transaction/widget/transaction_card.dart';
import 'package:xcash_app/view/screens/transaction/widget/transaction_history_bottom_sheet.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  late String trxType;

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
      trxType = Get.arguments ?? "";
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
          resizeToAvoidBottomInset: true,
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            backgroundColor: MyColor.getAppBarColor(),
            elevation: 0,
            title: Text(MyStrings.transaction.tr, style: regularLarge.copyWith(color: MyColor.getAppBarContentColor())),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
            ),
            actions: [
              ActionButtonIconWidget(
                  pressed: () => controller.changeSearchIcon(),
                  icon: controller.isSearch ? Icons.clear : Icons.filter_alt_sharp
              ),
            ],
          ),
          body: controller.isLoading ? const CustomLoader() :  Padding(
            padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: controller.isSearch,
                    child: const FiltersField(),
                  ),
                  controller.transactionList.isEmpty && controller.filterLoading == false ? const Center(
                      child:  NoDataWidget()
                  ) : controller.filterLoading ? const CustomLoader() : Expanded(
                    flex: 0,
                    child: ListView.separated(
                        controller: scrollController,
                        physics: const NeverScrollableScrollPhysics(),
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

                          return  TransactionCard(
                            index: index,
                            press: () => CustomBottomSheet(
                              child: TransactionHistoryBottomSheet(index: index)
                            ).customBottomSheet(context),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

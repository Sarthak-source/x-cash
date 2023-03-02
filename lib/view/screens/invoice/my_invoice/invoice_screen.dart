import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/invoice_history_controller.dart';
import 'package:xcash_app/data/repo/invoice/invoice_history_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/no_data.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/widget/invoice_card.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/widget/invoices_bottom_sheet.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  final ScrollController scrollController = ScrollController();

  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(Get.find<InvoiceHistoryController>().hasNext()){
        Get.find<InvoiceHistoryController>().loadInvoiceData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(InvoiceHistoryRepo(apiClient: Get.find()));
    final controller = Get.put(InvoiceHistoryController(invoiceHistoryRepo: Get.find()));

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
    return GetBuilder<InvoiceHistoryController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0,
            backgroundColor: MyColor.getAppBarColor(),
            title: Text(MyStrings.invoices, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
            ),
            actions: [
              ActionButtonIconWidget(
                pressed: () => Get.toNamed(RouteHelper.createInvoiceScreen),
                icon: Icons.add,
              ),
            ],
          ),
          body: controller.isLoading ? const CustomLoader() : controller.invoiceList.isEmpty ? const Center(
            child: NoDataWidget(),
          ) : SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.invoiceList.length + 1,
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index){
                  if (controller.invoiceList.length == index) {
                    return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                  }

                  return InkWell(
                    onTap: () => InvoicesBottomSheet.bottomSheet(context, index),
                    child: InvoiceCard(index: index),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
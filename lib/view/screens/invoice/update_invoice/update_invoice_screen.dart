import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/data/repo/invoice/update_invoice_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/screens/invoice/update_invoice/widget/floating_action_button.dart';
import 'package:xcash_app/view/screens/invoice/update_invoice/widget/update_invoice_details.dart';
import 'package:xcash_app/view/screens/invoice/update_invoice/widget/update_invoice_items.dart';

class UpdateInvoiceScreen extends StatefulWidget {
  const UpdateInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<UpdateInvoiceScreen> createState() => _UpdateInvoiceScreenState();
}

class _UpdateInvoiceScreenState extends State<UpdateInvoiceScreen> {

  late String invoiceNumber;
  late String walletId;

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(UpdateInvoiceRepo(apiClient: Get.find()));
    final controller = Get.put(UpdateInvoiceController(updateInvoiceRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      invoiceNumber = Get.arguments[0];
      walletId = Get.arguments[1] ?? '';
      controller.loadData(invoiceNum: invoiceNumber, walletId: walletId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateInvoiceController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
            backgroundColor: MyColor.getScreenBgColor(),
            appBar: CustomAppBar(
              title: MyStrings.updateInvoice,
              bgColor: MyColor.getAppBarColor(),
            ),
            body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpdateInvoiceDetails(invoiceNumber: invoiceNumber, walletId: walletId),
                  const SizedBox(height: Dimensions.space20),
                  controller.selectedCurrency?.currencyCode == MyStrings.selectOne ? const SizedBox() : const UpdateInvoiceItems(),
                  const SizedBox(height: Dimensions.space25),
                  controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                    press: (){
                      controller.updateInvoice();
                    },
                    text: MyStrings.updateInvoice,
                  )
                ],
              ),
            ),
          /*floatingActionButton: AnimatedFloatingActionButton(
            spaceBetween: -Dimensions.space15,
            fabButtons: [
              FabButton(
                text: MyStrings.sendToEmail,
                bgColor: MyColor.getPrimaryColor(),
                press: (){},
              ),
              FabButton(
                text: MyStrings.publishInvoice,
                bgColor: MyColor.colorGreen,
                press: (){},
              ),
              FabButton(
                text: MyStrings.discardInvoice,
                bgColor: MyColor.colorRed,
                press: (){},
              )
            ],
            colorStartAnimation: MyColor.primaryColor,
            colorEndAnimation: MyColor.primaryColor,
            animatedIconData: AnimatedIcons.add_event,
          ),*/
        ),
      ),
    );
  }
}

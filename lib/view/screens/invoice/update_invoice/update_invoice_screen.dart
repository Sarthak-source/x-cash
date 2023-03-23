import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/data/repo/invoice/update_invoice_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/action_button_icon_widget.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/screens/invoice/update_invoice/widget/invoice_payment_url_section.dart';
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

  final formKey = GlobalKey<FormState>();

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
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0,
              title: Text(MyStrings.updateInvoice.tr, style: regularDefault.copyWith(color: MyColor.getAppBarContentColor())),
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back, color: MyColor.getAppBarContentColor(), size: 20),
              ),
              actions: [
                ActionButtonIconWidget(
                  icon: Icons.email_outlined,
                  isLoading: controller.isSendToEmailLoading,
                  pressed: () => controller.invoiceSendToEmail(),
                ),
                ActionButtonIconWidget(
                  icon: Icons.publish,
                  isLoading: controller.isPublishInvoiceLoading,
                  pressed: () => controller.publishInvoice(),
                ),
                ActionButtonIconWidget(
                  icon: Icons.cancel_outlined,
                  isLoading: controller.isDiscardInvoiceLoading,
                  pressed: () => controller.discardInvoice(),
                ),
              ],
              backgroundColor: MyColor.getAppBarColor(),
            ),
            body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InvoicePaymentUrlSection(),
                    const SizedBox(height: Dimensions.space15),
                    UpdateInvoiceDetails(invoiceNumber: invoiceNumber, walletId: walletId),
                    const SizedBox(height: Dimensions.space20),
                    controller.selectedCurrency?.currencyCode == MyStrings.selectOne ? const SizedBox() : UpdateInvoiceItems(),
                    const SizedBox(height: Dimensions.space25),
                   RoundedButton(
                      press: (){
                        if (formKey.currentState!.validate()) {
                          controller.submitUpdateInvoice();
                        }
                      },
                      text: MyStrings.updateInvoice.tr,
                    )
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}

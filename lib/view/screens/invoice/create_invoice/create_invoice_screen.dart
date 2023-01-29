import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/invoice/create_invoice_controller.dart';
import 'package:xcash_app/data/repo/invoice/create_invoice_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_details.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_items.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(CreateInvoiceRepo(apiClient: Get.find()));
    final controller = Get.put(CreateInvoiceController(createInvoiceRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateInvoiceController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: CustomAppBar(
            title: MyStrings.createInvoice,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: controller.isLoading ? const CustomLoader() : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
            child: Column(
              children: [
                const InvoiceDetails(),
                const SizedBox(height: Dimensions.space20),
                const InvoiceItems(),
                const SizedBox(height: Dimensions.space25),
                RoundedButton(
                  press: (){},
                  text: MyStrings.createInvoice,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

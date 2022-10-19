import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_details.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_items.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          showBackIcon: true,
          elevation: 0,
          title: MyStrings.createInvoice,
          changeRoute: () => Get.toNamed(RouteHelper.myInvoiceScreen),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space15),
          child: Column(
            children: const [
              InvoiceDetails(),

              SizedBox(height: Dimensions.space20),

              InvoiceItems()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_details.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/invoice_items.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(
          isShowBackBtn: true,
          title: MyStrings.createInvoice,
        ),
        body: SingleChildScrollView(
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
    );
  }
}

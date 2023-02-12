import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/create_invoice_controller.dart';
import 'package:xcash_app/data/model/invoice/create_invoice_response_model.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/widget/create_invoice_wallet_bottom_sheet.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateInvoiceController>(
       builder: (controller) => CustomCard(
         width: MediaQuery.of(context).size.width,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const BottomSheetHeaderText(text: MyStrings.invoiceDetails),
             const CustomDivider(space: Dimensions.space15),
             Form(
               key: controller.formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextField(
                       needOutlineBorder: true,
                       labelText: MyStrings.invoiceTo,
                       hintText: MyStrings.enterInvoiceTo,
                       controller: controller.invoiceToController,
                       onChanged: (value){}
                   ),
                   const SizedBox(height: Dimensions.space15),
                   CustomTextField(
                       needOutlineBorder: true,
                       labelText: MyStrings.email,
                       hintText: MyStrings.enterEmail,
                       controller: controller.emailController,
                       onChanged: (value){}
                   ),
                   const SizedBox(height: Dimensions.space15),
                   CustomTextField(
                       needOutlineBorder: true,
                       labelText: MyStrings.address,
                       hintText: MyStrings.enterAddress,
                       controller: controller.addressController,
                       onChanged: (value){}
                   ),
                   const SizedBox(height: Dimensions.space15),

                   const LabelText(text: MyStrings.yourWallet),
                   const SizedBox(height: Dimensions.textToTextSpace),
                   FilterRowWidget(
                       borderColor: controller.selectedCurrency?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                       text: "${controller.selectedCurrency?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedCurrency?.currencyCode}",
                       press: () {
                         createInvoiceWalletBottomSheet(controller.currencyList, context: context);
                       }
                   ),
                 ],
               ),
             )
           ],
         ),
       )
    );
  }
}

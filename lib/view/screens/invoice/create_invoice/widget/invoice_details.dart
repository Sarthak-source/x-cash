import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                   CustomDropDownTextField(
                       labelText: MyStrings.yourWallet,
                       selectedValue: controller.selectedCurrency,
                       onChanged: (value){
                         controller.setSelectedCurrency(value);
                       },
                       items: controller.currencyList.map((Currencies val){
                         return DropdownMenuItem<Currencies>(
                             value: val,
                             child: Text(
                               val.currencyCode ?? "",
                               style: regularSmall,
                             )
                         );
                       }).toList()
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

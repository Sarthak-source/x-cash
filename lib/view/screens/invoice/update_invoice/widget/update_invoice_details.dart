import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/data/model/invoice/update_invoice_response_model.dart' as model;
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class UpdateInvoiceDetails extends StatefulWidget {
  final String invoiceNumber;
  final String walletId;

  const UpdateInvoiceDetails({
    Key? key,
    required this.invoiceNumber,
    required this.walletId
  }) : super(key: key);

  @override
  State<UpdateInvoiceDetails> createState() => _UpdateInvoiceDetailsState();
}

class _UpdateInvoiceDetailsState extends State<UpdateInvoiceDetails> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateInvoiceController>(
       builder: (controller) => CustomCard(
         width: MediaQuery.of(context).size.width,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const BottomSheetHeaderText(text: MyStrings.invoiceDetails),
                 BottomSheetHeaderText(text: "#${widget.invoiceNumber}"),
               ],
             ),
             const CustomDivider(space: Dimensions.space15),
             Form(
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
                       items: controller.currencyList.map((model.Currencies val){
                         return DropdownMenuItem<model.Currencies>(
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

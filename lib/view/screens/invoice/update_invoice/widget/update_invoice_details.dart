import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/data/model/invoice/update_invoice_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/widget/status_widget.dart';

import '../../../../components/bottom-sheet/bottom_sheet_header_row.dart';
import '../../../../components/card/bottom_sheet_card.dart';

class UpdateInvoiceDetails extends StatefulWidget {
  final String invoiceNumber;
  final String walletId;
  final dynamic formKey;

  const UpdateInvoiceDetails({
    Key? key,
    required this.invoiceNumber,
    required this.walletId,
    required this.formKey
  }) : super(key: key);

  @override
  State<UpdateInvoiceDetails> createState() => _UpdateInvoiceDetailsState();
}

class _UpdateInvoiceDetailsState extends State<UpdateInvoiceDetails> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateInvoiceController>(
       builder: (controller) => Container(
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
             color: MyColor.transparentColor,
             borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
             border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5)
         ),
         padding: const EdgeInsets.all(Dimensions.space15),
         child: Form(
           key: widget.formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              /* Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   StatusWidget(
                       status: controller.getPaymentStatusOrColor(),
                       color: controller.getPaymentStatusOrColor(isStatus: false)
                   )
                 ],
               ),
               const SizedBox(height: Dimensions.space10),*/
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
                         labelText: MyStrings.invoiceTo.tr,
                         hintText: MyStrings.enterInvoiceTo.tr,
                         controller: controller.invoiceToController,
                         onChanged: (value){},
                         validator: (value) {
                           if (value!.isEmpty) {
                             return MyStrings.invoiceToEmptyMsg.tr;
                           }else {
                             return null;
                           }
                         },

                     ),
                     const SizedBox(height: Dimensions.space15),
                     CustomTextField(
                         needOutlineBorder: true,
                         labelText: MyStrings.email.tr,
                         hintText: MyStrings.enterEmail.tr,
                         controller: controller.emailController,
                         onChanged: (value){},
                         validator: (value) {
                           if (value!.isEmpty) {
                             return MyStrings.emailAddressEmptyMsg.tr;
                           }  else {
                             return null;
                           }
                         },
                     ),
                     const SizedBox(height: Dimensions.space15),
                     CustomTextField(
                         needOutlineBorder: true,
                         labelText: MyStrings.address.tr,
                         hintText: MyStrings.enterAddress.tr,
                         controller: controller.addressController,
                         onChanged: (value){},
                         validator: (value) {
                           if (value!.isEmpty) {
                             return MyStrings.addressEmptyMsg.tr;
                           } else {
                             return null;
                           }
                         },
                     ),
                     const SizedBox(height: Dimensions.space15),
                     const LabelText(text: MyStrings.yourWallet),
                     const SizedBox(height: Dimensions.textToTextSpace),
                     FilterRowWidget(
                         borderColor: controller.selectedCurrency?.id.toString() == "-1" ? MyColor.textFieldDisableBorderColor : MyColor.textFieldEnableBorderColor,
                         text: "${controller.selectedCurrency?.id.toString() == "-1" ? MyStrings.selectWallet : controller.selectedCurrency?.currencyCode}",
                         press: () {
                           CustomBottomSheet(
                               child: Column(
                                 children: [
                                   const BottomSheetHeaderRow(header: MyStrings.selectWallet,),
                                   ListView.builder(
                                       itemCount: controller.currencyList.length,
                                       shrinkWrap: true,
                                       physics: const NeverScrollableScrollPhysics(),
                                       itemBuilder: (context, index) {
                                         return GestureDetector(
                                           onTap: () {
                                             final controller= Get.find<UpdateInvoiceController>();
                                             Currencies selectedValue = controller.currencyList[index];
                                             controller.setSelectedCurrency(selectedValue);
                                             Navigator.pop(context);

                                             FocusScopeNode currentFocus = FocusScope.of(context);
                                             if (!currentFocus.hasPrimaryFocus) {
                                               currentFocus.unfocus();
                                             }
                                           },
                                           child: BottomSheetCard(
                                             child: Text(
                                               controller.currencyList[index].currencyCode ?? "",
                                               style: regularDefault,
                                             ),
                                           ),
                                         );
                                       })
                                 ],
                               )
                           ).customBottomSheet(context);
                         }
                     ),
                   ],
                 ),
               )
             ],
           ),
         ),
       )
    );
  }
}

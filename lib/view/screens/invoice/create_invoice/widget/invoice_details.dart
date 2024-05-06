import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/create_invoice_controller.dart';
import 'package:xcash_app/data/model/invoice/create_invoice_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/card/bottom_sheet_card.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
import 'package:xcash_app/view/screens/transaction/widget/filter_row_widget.dart';
import '../../../../components/bottom-sheet/bottom_sheet_header_row.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateInvoiceController>(
       builder: (controller) =>Form(
         key: formKey,
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
                 textInputType: TextInputType.emailAddress,
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
                 press: () => CustomBottomSheet(
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
                                 final controller= Get.find<CreateInvoiceController>();
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
                                   controller.currencyList[index].currencyCode?.tr??'',
                                   style: regularDefault,
                                 ),
                               ),
                             );
                           })
                     ],
                   )
                 ).customBottomSheet(context)
             ),
             const SizedBox(height: Dimensions.space30),
             RoundedButton(
               press: (){
                 if (formKey.currentState!.validate()) {
                   FocusScope.of(context).unfocus();
                   controller.checkValidation(context);
                 }
               },
               text: MyStrings.next.tr,
             )
           ],
         ),
       )
    );
  }
}

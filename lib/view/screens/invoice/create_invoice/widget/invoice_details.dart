import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/create_invoice_controller.dart';
import 'package:xcash_app/data/model/invoice/create_invoice_response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';
import 'package:xcash_app/view/components/text/label_text.dart';
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
       builder: (controller) => Column(
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
               press: () => CustomBottomSheet(
                 child: Column(
                   children: [
                     Align(
                       alignment: Alignment.topCenter,
                       child: Container(
                         height: 5,
                         width: 50,
                         padding: const EdgeInsets.all(1),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: MyColor.colorGrey.withOpacity(0.1),
                         ),
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: const [BottomSheetCloseButton()],
                     ),
                     const SizedBox(height: Dimensions.space15),
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
                             child: Container(
                               padding: const EdgeInsets.all(15),
                               margin: const EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                   border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                               ),
                               child: Text(
                                 controller.currencyList[index].currencyCode ?? "",
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
               controller.checkValidation(context);
             },
             text: MyStrings.next,
           )
         ],
       )
    );
  }
}

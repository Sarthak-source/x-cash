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
       builder: (controller) => Container(
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
             color: MyColor.transparentColor,
             borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
             border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5)
         ),
         padding: const EdgeInsets.all(Dimensions.space15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 StatusWidget(
                     status: controller.getPaymentStatusOrColor(),
                     color: controller.getPaymentStatusOrColor(isStatus: false)
                 )
               ],
             ),
             const SizedBox(height: Dimensions.space10),
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
                                         final controller= Get.find<UpdateInvoiceController>();
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
                 ],
               ),
             )
           ],
         ),
       )
    );
  }
}

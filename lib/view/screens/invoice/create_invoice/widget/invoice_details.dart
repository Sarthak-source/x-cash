import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

  var selectWalletValue = "Select Wallet";
  List<String> walletItems = ["Select Wallet", "TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR"];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeaderText(text: MyStrings.invoiceDetails),

            const CustomDivider(height: Dimensions.space15),

            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                      labelText: MyStrings.invoiceTo,
                      hintText: "Enter ${MyStrings.invoiceTo}",
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space15),

                  CustomTextFormField(
                      labelText: MyStrings.email,
                      hintText: "Enter ${MyStrings.email}",
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space15),

                  CustomTextFormField(
                      labelText: MyStrings.address,
                      hintText: "Enter ${MyStrings.address}",
                      onChanged: (value){}
                  ),
                  const SizedBox(height: Dimensions.space15),

                  CustomDropDownTextField(
                      labelText: MyStrings.yourWallet,
                      hintText: selectWalletValue,
                      selectedValue: selectWalletValue,
                      onChanged: (value){
                        setState(() {
                          selectWalletValue = value.toString();
                        });
                      },
                      items: walletItems.map((String val){
                        return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: interRegularSmall,
                            )
                        );
                      }).toList()
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

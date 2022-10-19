import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/components/text-form-field/another_custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class InvoiceItems extends StatefulWidget {
  const InvoiceItems({Key? key}) : super(key: key);

  @override
  State<InvoiceItems> createState() => _InvoiceItemsState();
}

class _InvoiceItemsState extends State<InvoiceItems> {

  @override
  Widget build(BuildContext context) {

    return CustomCard(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeaderText(text: MyStrings.invoiceItems),

            const CustomDivider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 135,
                      child: AnotherCustomTextField(
                          labelText: MyStrings.itemName,
                          hintText: MyStrings.itemNameHint,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    SizedBox(
                      width: 135,
                      child: AnotherCustomTextField(
                          labelText: MyStrings.amount,
                          hintText: MyStrings.amountHint,
                          onChanged: (value){}
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 30, width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: MyColor.colorWhite,
                      shape: BoxShape.circle, border: Border.all(color: MyColor.primarySubTextColor.withOpacity(0.8), width: 1.2)
                    ),
                    child: Icon(Icons.add, color: MyColor.primarySubTextColor.withOpacity(0.8), size: 20),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

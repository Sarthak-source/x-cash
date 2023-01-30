import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class UpdateInvoiceItems extends StatefulWidget {
  const UpdateInvoiceItems({Key? key}) : super(key: key);

  @override
  State<UpdateInvoiceItems> createState() => _UpdateInvoiceItemsState();
}

class _UpdateInvoiceItemsState extends State<UpdateInvoiceItems> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UpdateInvoiceController>(
      builder: (controller) => CustomCard(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeaderText(text: MyStrings.invoiceItems),
            const CustomDivider(),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.invoiceItemList.length,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space15),
              itemBuilder: (context, index){
                return index == 0 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 120,
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.itemName,
                          controller: controller.invoiceItemList[index].itemNameController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    SizedBox(
                      width: 120,
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.amount,
                          textInputType: TextInputType.number,
                          controller: controller.invoiceItemList[index].amountController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          controller.increaseNumberField();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.space8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(color: MyColor.colorGreen, shape: BoxShape.circle),
                          child: const Icon(Icons.add, color: MyColor.colorWhite, size: 20),
                        ),
                      ),
                    )
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 120,
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.itemName,
                          controller: controller.invoiceItemList[index].itemNameController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    SizedBox(
                      width: 120,
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.amount,
                          textInputType: TextInputType.number,
                          controller: controller.invoiceItemList[index].amountController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          controller.decreaseNumberField(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.space8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(color: MyColor.colorRed, shape: BoxShape.circle),
                          child: const Icon(Icons.clear, color: MyColor.colorWhite, size: 20),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/create_invoice_controller.dart';
import 'package:xcash_app/view/components/card/custom_card.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class InvoiceItems extends StatefulWidget {
  const InvoiceItems({Key? key}) : super(key: key);

  @override
  State<InvoiceItems> createState() => _InvoiceItemsState();
}

class _InvoiceItemsState extends State<InvoiceItems> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CreateInvoiceController>(
      builder: (controller) => CustomCard(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeaderText(text: MyStrings.invoiceItems),
            const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  child: CustomTextField(
                      needOutlineBorder: true,
                      labelText: MyStrings.itemName,
                      controller: controller.itemController,
                      onChanged: (value){}
                  ),
                ),
                const SizedBox(width: Dimensions.space10),
                SizedBox(
                  width: 120,
                  child: CustomTextField(
                      textInputType: TextInputType.number,
                      needOutlineBorder: true,
                      labelText: MyStrings.amount,
                      controller: controller.amountController,
                      onChanged: (value){
                        controller.calculateInvoiceAmount();
                      }
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
            ),
            SizedBox(height: controller.invoiceItemList.isEmpty ? 0 : Dimensions.space15),
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.invoiceItemList.length,
              separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space15),
              itemBuilder: (context, index){

                return Row(
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
                          onChanged: (value){
                            controller.calculateInvoiceAmount();
                          }
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
            const SizedBox(height: Dimensions.space15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                controller.selectedCurrency?.currencyCode == MyStrings.selectOne ? " " : "${MyStrings.totalAmount}: ${controller.totalInvoiceAmount}",
                style: regularDefault,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
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
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(Dimensions.space15),
        decoration: BoxDecoration(
          color: MyColor.transparentColor,
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeaderText(text: MyStrings.invoiceItems),
            const SizedBox(height: Dimensions.space20),
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
                    Expanded(
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.itemName,
                          controller: controller.invoiceItemList[index].itemNameController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Expanded(
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
                  ],
                ) : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextField(
                          needOutlineBorder: true,
                          labelText: MyStrings.itemName,
                          controller: controller.invoiceItemList[index].itemNameController,
                          onChanged: (value){}
                      ),
                    ),
                    const SizedBox(width: Dimensions.space10),
                    Expanded(
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
                    GestureDetector(
                      onTap: (){
                        controller.decreaseNumberField(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(Dimensions.space5),
                        margin: const EdgeInsets.only(top: Dimensions.space20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: MyColor.colorOrange, shape: BoxShape.circle),
                        child: const Icon(Icons.clear, color: MyColor.colorWhite, size: 15),
                      ),
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: Dimensions.space20),
            GestureDetector(
              onTap: () => controller.increaseNumberField(),
              child: Row(
                children: [
                  const Icon(Icons.add, color: MyColor.primaryColor, size: 20),
                  const SizedBox(width: Dimensions.space10),
                  Text(MyStrings.addItems.tr, style: regularDefault.copyWith(color: MyColor.primaryColor))
                ],
              ),
            ),
            const SizedBox(height: Dimensions.space20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space12, horizontal: Dimensions.space15),
              decoration: BoxDecoration(
                  border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5),
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
              ),
              child: Text(
                "${MyStrings.totalAmount.tr}: ${controller.totalInvoiceAmount}",
                style: regularDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

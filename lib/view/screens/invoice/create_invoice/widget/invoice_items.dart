import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

import '../../../../../data/controller/invoice/create_invoice_controller.dart';

class InvoiceItems extends StatefulWidget {

  final String invoiceTo;
  final String email;
  final String address;
  final String selectWallet;

  const InvoiceItems({
    Key? key,
    required this.invoiceTo,
    required this.email,
    required this.address,
    required this.selectWallet
  }) : super(key: key);

  @override
  State<InvoiceItems> createState() => _InvoiceItemsState();
}

class _InvoiceItemsState extends State<InvoiceItems> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return GetBuilder<CreateInvoiceController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.screenBgColor,
          appBar: CustomAppBar(
            title: MyStrings.createInvoice,
            bgColor: MyColor.getAppBarColor(),
          ),
          body: SingleChildScrollView(
            padding: Dimensions.screenPaddingHV,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextField(
                            needOutlineBorder: true,
                            labelText: MyStrings.itemName.tr,
                            controller: controller.itemController,
                            onChanged: (value){},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return MyStrings.plsFillOutFieldMsg.tr;
                              }else {
                                return null;
                              }
                            },
                        ),
                      ),
                      const SizedBox(width: Dimensions.space10),
                      Expanded(
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            needOutlineBorder: true,
                            labelText: MyStrings.amount.tr,
                            controller: controller.amountController,
                            onChanged: (value){
                              controller.calculateInvoiceAmount();
                            },
                            validator: (value) {
                            if (value!.isEmpty) {
                              return MyStrings.plsFillOutFieldMsg.tr;
                            }else {
                              return null;
                            }
                          },
                        ),
                      ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextField(
                                needOutlineBorder: true,
                                labelText: MyStrings.itemName,
                                controller: controller.invoiceItemList[index].itemNameController,
                                onChanged: (value){},
                                validator: (value) {
                                if (value!.isEmpty) {
                                  return MyStrings.plsFillOutFieldMsg.tr;
                                }else {
                                  return null;
                                }
                              },
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
                                },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return MyStrings.plsFillOutFieldMsg.tr;
                                }else {
                                  return null;
                                }
                              },
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
                  const SizedBox(height: Dimensions.space30),
                  RoundedButton(
                      text: MyStrings.createInvoice.tr,
                      press: () {
                        if (formKey.currentState!.validate()) {
                          controller.confirmInvoice();
                        }
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

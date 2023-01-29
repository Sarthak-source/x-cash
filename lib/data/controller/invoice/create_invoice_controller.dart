import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/create_invoice_response_model.dart';
import 'package:xcash_app/data/repo/invoice/create_invoice_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class CreateInvoiceController extends GetxController{

  CreateInvoiceRepo createInvoiceRepo;
  CreateInvoiceController({required this.createInvoiceRepo});

  final formKey = GlobalKey<FormState>();

  bool isLoading = true;

  CreateInvoiceResponseModel model = CreateInvoiceResponseModel();
  Currencies? selectedCurrency = Currencies();

  List<Currencies> currencyList = [];
  List<InvoiceItemsModel> invoiceItemList = [];

  TextEditingController invoiceToController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  void increaseNumberField(){
    invoiceItemList.add(InvoiceItemsModel(itemNameController: TextEditingController(), amountController: TextEditingController()));
    update();
  }

  void decreaseNumberField(int index){
    invoiceItemList.removeAt(index);
    update();
  }



  setSelectedCurrency(Currencies? currencies){
    selectedCurrency = currencies;
    update();
  }

  Future<void> loadData() async{

    isLoading = true;
    update();

    currencyList.clear();

    invoiceToController.text = "";
    emailController.text = "";
    addressController.text = "";

    selectedCurrency = Currencies(id: -1, currencyCode: MyStrings.selectOne);
    currencyList.insert(0, selectedCurrency!);
    setSelectedCurrency(selectedCurrency);

    ResponseModel responseModel = await createInvoiceRepo.getData();
    if(responseModel.statusCode == 200){
      model = CreateInvoiceResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Currencies>? tempCurrencyList = model.data?.currencies;
        if(tempCurrencyList != null && tempCurrencyList.isNotEmpty){
          currencyList.addAll(tempCurrencyList);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }
}

class InvoiceItemsModel{

  final TextEditingController itemNameController;
  final TextEditingController amountController;

  const InvoiceItemsModel({required this.itemNameController, required this.amountController});
}
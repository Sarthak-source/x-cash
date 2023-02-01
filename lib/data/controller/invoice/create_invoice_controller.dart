import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/create_invoice_response_model.dart';
import 'package:xcash_app/data/model/invoice/invoice_items_model.dart';
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

  TextEditingController itemController = TextEditingController();
  TextEditingController amountController = TextEditingController();


  void increaseNumberField(){
    invoiceItemList.add(InvoiceItemsModel(itemNameController: TextEditingController(), amountController: TextEditingController()));
    update();
  }

  void decreaseNumberField(int index){
    invoiceItemList.removeAt(index);
    update();
  }

  String  totalInvoiceAmount = '';
  void calculateInvoiceAmount(){

    double totalAmount = 0;

    double firstInvoiceAmount = double.tryParse(amountController.text.toString())??0;
    totalAmount = totalAmount + firstInvoiceAmount ;

    for (var invoice in invoiceItemList) {
      double  invoiceAmount = double.tryParse(invoice.amountController.text)??0;
      totalAmount = totalAmount + invoiceAmount;
    }

    totalInvoiceAmount = '${Converter.twoDecimalPlaceFixedWithoutRounding(totalAmount.toString())} ${selectedCurrency?.currencyCode??''}';
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

  bool isSubmitLoading = false;
  Future <void> submitInvoice() async{
    isSubmitLoading = true;
    update();

    String invoiceTo = invoiceToController.text.toString();
    String email = emailController.text.toString();
    String address = addressController.text.toString();
    String curId = selectedCurrency?.id.toString()??'';

    if(invoiceTo.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.invoiceFieldErrorMsg]);
      return ;
    }
    if(email.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.invoiceEmailFieldErrorMsg]);
      return ;
    }
    if(address.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.invoiceAddressFieldErrorMsg]);
      return ;
    }
    if(curId == "0"){
      CustomSnackBar.error(errorList: [MyStrings.invoiceWalletErrorMsg]);
      return ;
    }

    String firstInvoice = itemController.text.toString();
    String firstInvoiceAmount = amountController.text.toString();

    if(firstInvoice.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.invoiceItemNameErrorMsg]);
      return ;
    } if(firstInvoiceAmount.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.invoiceAmountErrorMsg]);
      return ;
    }

    ResponseModel responseModel = await createInvoiceRepo.createInvoice(invoiceTo,email,address,curId,firstInvoice,firstInvoiceAmount,invoiceItemList);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        Get.offAndToNamed(RouteHelper.invoiceScreen);
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
      return ;
    }

    isSubmitLoading = false;
    update();
  }
}
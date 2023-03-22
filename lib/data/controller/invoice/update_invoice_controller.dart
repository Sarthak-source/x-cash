import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/invoice_items_model.dart';
import 'package:xcash_app/data/model/invoice/update_invoice_response_model.dart';
import 'package:xcash_app/data/repo/invoice/update_invoice_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class UpdateInvoiceController extends GetxController{

  UpdateInvoiceRepo updateInvoiceRepo;
  UpdateInvoiceController({required this.updateInvoiceRepo});

  bool isLoading = true;
  UpdateInvoiceResponseModel model = UpdateInvoiceResponseModel();

  Currencies? selectedCurrency = Currencies();

  List<Currencies> currencyList = [];
  List<InvoiceItemsModel> invoiceItemList = [];

  TextEditingController invoiceToController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController invoiceItemController = TextEditingController();
  TextEditingController invoiceAmountController = TextEditingController();

  void increaseNumberField(){
    invoiceItemList.add(InvoiceItemsModel(itemNameController: TextEditingController(), amountController: TextEditingController()));
    update();
  }

  void decreaseNumberField(int index){
    invoiceItemList.removeAt(index);
    calculateInvoiceAmount();
    update();
  }

  setSelectedCurrency(Currencies? currencies){
    selectedCurrency = currencies;
    update();
  }

  Future<void> loadData({required String invoiceNum, required String walletId}) async{
    isLoading = true;
    update();

    currencyList.clear();

    selectedCurrency = Currencies(id: -1, currencyCode: MyStrings.selectOne);
    currencyList.insert(0, selectedCurrency!);
    setSelectedCurrency(selectedCurrency);

    ResponseModel responseModel = await updateInvoiceRepo.getData(invoiceNum: invoiceNum);
    if(responseModel.statusCode == 200){
      model = UpdateInvoiceResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      invoiceToController.text = model.data?.invoice?.invoiceTo ?? "";
      emailController.text = model.data?.invoice?.email ?? "";
      addressController.text = model.data?.invoice?.address ?? "";
      totalInvoiceAmount = Converter.formatNumber(model.data?.invoice?.totalAmount ?? "");

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Currencies>? tempCurrencyList = model.data?.currencies;
        if(tempCurrencyList != null && tempCurrencyList.isNotEmpty){
          if(walletId.isNotEmpty){
            for(Currencies value in tempCurrencyList){
              currencyList.add(value);
              if(value.id.toString() == walletId){
                setSelectedCurrency(value);
              }
            }
          }
          else{
            currencyList.addAll(tempCurrencyList);
          }
        }

        List<InvoiceItems>? tempInvoiceItemList = model.data?.invoiceItems;
        if(tempInvoiceItemList != null && tempInvoiceItemList.isNotEmpty){
          for (var element in tempInvoiceItemList) {
            String itemName = element.itemName ?? "";
            String amount = Converter.formatNumber(element.amount ?? "");
            InvoiceItemsModel items = InvoiceItemsModel(itemNameController: TextEditingController(text: itemName), amountController: TextEditingController(text: amount));
            invoiceItemList.add(items);
          }
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

  bool submitLoading = false;
  Future<void> updateInvoice() async{



    if(selectedCurrency?.currencyCode?.toLowerCase() == MyStrings.selectOne.toLowerCase()){
      CustomSnackBar.error(errorList: [MyStrings.selectWallet]);
      return;
    }


    String invoiceId = model.data?.invoice?.id.toString() ?? "";
    String invoiceTo = invoiceToController.text.toString();
    String email = emailController.text.toString();
    String address = addressController.text.toString();
    String currencyId = selectedCurrency?.id.toString() ?? "";

    String invoiceName = invoiceItemController.text.toString();
    String invoiceAmount = invoiceAmountController.text.toString();

    submitLoading = true;
    update();

    ResponseModel responseModel = await updateInvoiceRepo.updateInvoice(
        invoiceId: invoiceId,
        invoiceTo: invoiceTo,
        email: email,
        address: address,
        currencyId: currencyId,
        invoiceItemName: invoiceName,
        invoiceAmount: invoiceAmount,
        invoiceItemList: invoiceItemList
    );

    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        Get.back(result: 'success');
        print('back');
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    submitLoading = false;
    update();
  }

  Future<void> invoiceSendToEmail() async{
    String invoiceId = model.data?.invoice?.id.toString() ?? "";

    ResponseModel responseModel = await updateInvoiceRepo.sendToEmail(invoiceId);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }

  Future<void> publishInvoice() async{
    String invoiceId = model.data?.invoice?.id.toString() ?? "";

    ResponseModel responseModel = await updateInvoiceRepo.publishInvoice(invoiceId);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }

  Future<void> discardInvoice() async{
    String invoiceId = model.data?.invoice?.id.toString() ?? "";

    ResponseModel responseModel = await updateInvoiceRepo.discardInvoice(invoiceId);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }

  dynamic getPaymentStatusOrColor({bool isStatus = true}){
    String paymentStatus = model.data?.invoice?.payStatus ?? '';

    if(isStatus){
      String text = paymentStatus == "0" ? MyStrings.unpaid
          : paymentStatus == "1" ? MyStrings.paid : "";
      return text;
    } else{
      Color color = paymentStatus == "0" ? MyColor.colorOrange
          : paymentStatus == "1" ? MyColor.colorGreen : MyColor.transparentColor;
      return color;
    }
  }

  String  totalInvoiceAmount = '';
  void calculateInvoiceAmount(){

    double totalAmount = 0;

    double firstInvoiceAmount = double.tryParse(invoiceAmountController.text.toString())??0;
    totalAmount = totalAmount + firstInvoiceAmount ;

    for (var invoice in invoiceItemList) {
      double  invoiceAmount = double.tryParse(invoice.amountController.text)??0;
      totalAmount = totalAmount + invoiceAmount;
    }

    totalInvoiceAmount = Converter.formatNumber(totalAmount.toString());
    update();
  }
}
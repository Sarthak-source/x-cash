import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/invoice_history_response_model.dart';
import 'package:xcash_app/data/repo/invoice/invoice_history_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class InvoiceHistoryController extends GetxController{

  InvoiceHistoryRepo invoiceHistoryRepo;
  InvoiceHistoryController({required this.invoiceHistoryRepo});

  bool isLoading = true;
  InvoiceHistoryResponseModel model = InvoiceHistoryResponseModel();

  int page = 0;
  String? nextPageUrl;

  List<Data> invoiceList = [];

  Future<void> initialData() async{
    page = 0;
    invoiceList.clear();
    isLoading = true;
    update();

    await loadInvoiceData();
    isLoading = false;
    update();
  }

  Future<void> loadInvoiceData() async{

    page = page + 1;
    if(page == 1){
      invoiceList.clear();
    }

    ResponseModel responseModel = await invoiceHistoryRepo.getAllInvoiceData(page);
    if(responseModel.statusCode == 200){
      model = InvoiceHistoryResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.invoices?.nextPageUrl;
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempInvoiceList = model.data?.invoices?.data;
        if(tempInvoiceList != null && tempInvoiceList.isNotEmpty){
          invoiceList.addAll(tempInvoiceList);
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

  bool hasNext(){
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }

  dynamic getStatusOrColor(int index,{bool isStatus = true}){
    String status = invoiceList[index].status ?? '';

    if(isStatus){
      String text = status == "0" ? MyStrings.notPublished
          : status == "1" ? MyStrings.published
          : status == "2" ? MyStrings.discarded
          : "";
      return text;
    } else{
      Color color = status == "0" ? MyColor.colorOrange
          : status == "1" ? MyColor.colorGreen
          : status == "2" ? MyColor.colorRed : MyColor.colorGreen;
      return color;
    }
  }

  dynamic getPaymentStatusOrColor(int index,{bool isStatus = true}){
    String paymentStatus = invoiceList[index].payStatus ?? '';

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
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/transctions/transaction_response_model.dart' as transaction;
import 'package:xcash_app/data/repo/transaction/transaction_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class TransactionHistoryController extends GetxController{

  TransactionRepo transactionRepo;
  TransactionHistoryController({required this.transactionRepo});

  bool isLoading = true;

  List<String> transactionTypeList = ["All Type", "Plus", "Minus"];
  List<String> operationTypeList = [];
  List<String> historyFormList = [];
  List<String> walletCurrencyList = [];

  List<transaction.Data> transactionList = [];

  String trxSearchText = "";
  String? nextPageUrl;
  int page = 0;
  String currency = "";

  TextEditingController trxController = TextEditingController();

  String selectedTransactionType = "All Type";
  String selectedOperationType = "";
  String selectedHistoryFrom = "";
  String selectedWalletCurrency = "";

  setSelectedTransactionType(String? trxType){
    selectedTransactionType = trxType ?? "";
    update();
  }

  setSelectedOperationType(String? operationType){
    selectedOperationType = operationType ?? "";
    update();
  }

  setSelectedHistoryFrom(String? historyFrom){
    selectedHistoryFrom = historyFrom ?? "";
    update();
  }

  setSelectedWalletCurrency(String? walletCurrency){
    selectedWalletCurrency = walletCurrency ?? "";
    update();
  }


  void loadDefaultData(String trxType){
    if(trxType.isNotEmpty){
      selectedTransactionType = trxType;
      isSearch = true;
    } else{
      selectedTransactionType = "All Type";
    }


    initialSelectedValue();
  }


  void initialSelectedValue() async{
    page = 0;
    selectedOperationType = "";
    selectedHistoryFrom = "";
    selectedWalletCurrency = "";

    trxController.text = "";
    trxSearchText = "";
    transactionList.clear();
    isLoading = true;
    update();
    await loadTransactionData();
    isLoading = false;
    update();
  }

  Future<void> loadTransactionData() async{

    page = page + 1;

    if(page == 1){
      operationTypeList.clear();
      historyFormList.clear();
      walletCurrencyList.clear();
      transactionList.clear();

      operationTypeList.insert(0, "All Operations");
      historyFormList.insert(0, "All Time");
      walletCurrencyList.insert(0, "All Currency");
    }

    ResponseModel responseModel = await transactionRepo.getTransactionData(
      page,
      searchText: trxSearchText,
      transactionType: selectedTransactionType.toLowerCase(),
      operationType: selectedOperationType.toLowerCase(),
      historyFrom: selectedHistoryFrom.toLowerCase(),
      walletCurrency: selectedWalletCurrency.toLowerCase()
    );

    if(responseModel.statusCode == 200){
      transaction.TransactionResponseModel model = transaction.TransactionResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.transactions?.nextPageUrl;

      if(model.status.toString().toLowerCase() == "success"){
        List<transaction.Data>? tempDataList = model.data?.transactions?.data;
        if(tempDataList != null && tempDataList.isNotEmpty){
          transactionList.addAll(tempDataList);
        }

        List<String>? tempOperationList = model.data?.operations;
        if(tempOperationList != null || tempOperationList!.isNotEmpty){
          operationTypeList.addAll(tempOperationList);
        }
        if(tempOperationList.isNotEmpty){
          selectedOperationType = operationTypeList[0];
          setSelectedOperationType(selectedOperationType);
        }

        List<String>? tempHistoryFromList = model.data?.times;
        if(tempHistoryFromList != null || tempHistoryFromList!.isNotEmpty){
          historyFormList.addAll(tempHistoryFromList);
        }
        if(tempHistoryFromList.isNotEmpty){
          selectedHistoryFrom = historyFormList[0];
          setSelectedHistoryFrom(selectedHistoryFrom);
        }

        List<String>? tempWalletCurrencyList = model.data?.currencies;
        if(tempWalletCurrencyList != null || tempWalletCurrencyList!.isNotEmpty){
          walletCurrencyList.addAll(tempWalletCurrencyList);
        }
        if(tempWalletCurrencyList.isNotEmpty){
          selectedWalletCurrency = walletCurrencyList[0];
          setSelectedWalletCurrency(selectedWalletCurrency);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    update();
  }

  Future<void> loadFilteredTransactions() async{

    page = page + 1;

    if(page == 1){
      transactionList.clear();
    }

    ResponseModel responseModel = await transactionRepo.getTransactionData(
        page,
        searchText: trxSearchText,
        transactionType: selectedTransactionType.toLowerCase(),
        operationType: selectedOperationType.toLowerCase(),
        historyFrom: selectedHistoryFrom.toLowerCase(),
        walletCurrency: selectedWalletCurrency.toLowerCase()
    );

    if(responseModel.statusCode == 200){
      transaction.TransactionResponseModel model = transaction.TransactionResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.transactions?.nextPageUrl;


      if(model.status.toString().toLowerCase() == "success"){
        List<transaction.Data>? tempDataList = model.data?.transactions?.data;
        if(tempDataList != null && tempDataList.isNotEmpty){
          transactionList.addAll(tempDataList);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    update();
  }

  bool filterLoading = false;

  Future<void> filterData() async{
    trxSearchText = trxController.text;
    page = 0;
    filterLoading = true;
    update();
    transactionList.clear();
    FocusScope.of(Get.context!).unfocus();
    await loadFilteredTransactions();
    filterLoading = false;
    update();
  }

  bool hasNext(){
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null' ? true : false;
  }

  bool isSearch = false;
  void changeSearchIcon(){
    isSearch = !isSearch;
    update();

    if(!isSearch){
      selectedTransactionType = "All Type";
      initialSelectedValue();
    }
  }
}
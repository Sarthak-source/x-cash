import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/exchange/exchange_money_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/repo/exchange/exchange_money_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class ExchangeMoneyController extends GetxController{

  ExchangeMoneyRepo exchangeMoneyRepo;
  ExchangeMoneyController({required this.exchangeMoneyRepo});

  bool isLoading = true;
  List<FromWallets> fromWalletList = [];
  List<ToWallets> toWalletList = [];

  String currency = "";
  String toCurrency = "";
  String amount = "";
  String exchangeAmount = '0';

  TextEditingController amountController = TextEditingController();
  TextEditingController toAmountController = TextEditingController();

  FromWallets? fromWalletMethod = FromWallets();
  ToWallets? toWalletMethod = ToWallets();

  double mainAmount = 0;

  setFromWalletMethod(FromWallets? fromWallets){
    fromWalletMethod = fromWallets;
    currency = fromWalletMethod?.id==-1?'':fromWalletMethod?.currencyCode ?? " ";
    String amt = amountController.text.toString();
    mainAmount = amt.isEmpty ? 0 : double.tryParse(amt) ?? 0;
    calculateExchangeAmount(mainAmount);
    update();
  }


  setToWalletMethod(ToWallets? toWallets){
    toWalletMethod = toWallets;
    toCurrency = toWalletMethod?.id==-1?'':toWalletMethod?.currencyCode ?? " ";
    update();
  }

  loadData() async{
    isLoading = true;
    update();

    ResponseModel responseModel = await exchangeMoneyRepo.getExchangeData();
    fromWalletList.clear();
    toWalletList.clear();

    amountController.text = "";
    toAmountController.text = "0.00";

    fromWalletMethod = FromWallets(id: -1, currencyCode: MyStrings.selectOne);
    fromWalletList.insert(0, fromWalletMethod!);
    setFromWalletMethod(fromWalletMethod);

    toWalletMethod = ToWallets(id: -1, currencyCode: MyStrings.selectOne);
    toWalletList.insert(0, toWalletMethod!);
    setToWalletMethod(toWalletMethod);

    if(responseModel.statusCode == 200){
      ExchangeMoneyResponseModel model = ExchangeMoneyResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){

        List<FromWallets>? tempFromWallets = model.data?.fromWallets;
        if(tempFromWallets != null && tempFromWallets.isNotEmpty){
          fromWalletList.addAll(tempFromWallets);
        }

        List<ToWallets>? tempToWallets = model.data?.toWallets;
        if(tempToWallets != null && tempToWallets.isNotEmpty){
          toWalletList.addAll(tempToWallets);
        }
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  bool canExchange(){

    if(fromWalletMethod?.id == -1){
      CustomSnackBar.error(errorList: [MyStrings.selectFromCurrency]);
      return false;
    }

    if(toWalletMethod?.id == -1){
      CustomSnackBar.error(errorList: [MyStrings.selectToCurrency]);
      return false;
    }

    amount = amountController.text.toString();
    if(amount.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.enterAmount]);
      return false;
    }

    return true;
  }

  Future<void> submitExchangeMoney() async{
    submitLoading = true;
    update();

    ResponseModel responseModel = await exchangeMoneyRepo.confirmExchangeMoney(
        amount: amount,
        fromWalletId: fromWalletMethod?.id.toString() ?? '-1',
        toWalletId: toWalletMethod?.id.toString() ?? '-1'
    );

    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        Get.back();
        amountController.text = "";
        CustomSnackBar.success(successList: model.message?.success ?? ["Money Exchange Successfully"]);
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

  bool submitLoading = false;
  void submitLoadingState(){
    submitLoading = !submitLoading;
    update();
  }

  void calculateExchangeAmount(double amount){

    if(fromWalletMethod?.id.toString() == '-1'){
      CustomSnackBar.error(errorList: [MyStrings.selectFromCurrency]);
      return ;
    }

      double fromCurrencyRate = double.tryParse(fromWalletMethod?.currency?.rate ?? "0") ?? 0;

      double basicAmount = amount * fromCurrencyRate;
      double toCurrencyRate = double.tryParse(toWalletMethod?.currency?.rate ?? "0") ?? 0;
      double finalAmount = basicAmount / toCurrencyRate;
      String currencyType = toWalletMethod?.currency?.currencyType ?? "-1";
      if(currencyType == "1"){
        exchangeAmount = Converter.twoDecimalPlaceFixedWithoutRounding(finalAmount.toString(),precision: 2);
        toAmountController.text = toWalletMethod?.id.toString() == "-1" ? "0.00" : exchangeAmount.toString();
      }
      else{
        exchangeAmount = Converter.twoDecimalPlaceFixedWithoutRounding(finalAmount.toString(),precision: 8);
        toAmountController.text = toWalletMethod?.id.toString() == "-1" ? "0.00" : exchangeAmount.toString();
      }
  }
}
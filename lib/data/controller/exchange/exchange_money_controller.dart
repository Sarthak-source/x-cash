import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/data/model/exchange/exchange_money_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/repo/exchange/exchange_money_repo.dart';

class ExchangeMoneyController extends GetxController{

  ExchangeMoneyRepo exchangeMoneyRepo;
  ExchangeMoneyController({required this.exchangeMoneyRepo});

  bool isLoading = true;
  List<FromWallets> fromWalletList = [];
  List<ToWallets> toWalletList = [];

  String currency = "";

  TextEditingController amountController = TextEditingController();

  FromWallets? fromWalletMethod = FromWallets();
  ToWallets? toWalletMethod = ToWallets();

  setFromWalletMethod(FromWallets? fromWallets){
    fromWalletMethod = fromWallets;
    update();
  }

  setToWalletMethod(ToWallets? toWallets){
    toWalletMethod = toWallets;
    update();
  }

  beforeInitLoadData() async{
    currency = exchangeMoneyRepo.apiClient.getCurrencyOrUsername();
    isLoading = true;
    update();

    ResponseModel responseModel = await exchangeMoneyRepo.getExchangeData();
    fromWalletList.clear();
    toWalletList.clear();

    amountController.text = "";
  }
}
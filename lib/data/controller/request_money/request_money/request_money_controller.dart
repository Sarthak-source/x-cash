import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/request_money/request_money/request_money_response_model.dart';
import 'package:xcash_app/data/repo/request_money/request_money_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class RequestMoneyController extends GetxController{

  RequestMoneyRepo requestMoneyRepo;
  RequestMoneyController({required this.requestMoneyRepo});

  bool isLoading = true;
  String currency = "";

  RequestMoneyResponseModel model = RequestMoneyResponseModel();

  Wallets? selectedWallet = Wallets();
  String totalCharge = "";
  String limit = "";

  TextEditingController amountController = TextEditingController();
  TextEditingController requestToController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<Wallets> walletList = [];

  setWalletMethod(Wallets? wallets){
    selectedWallet = wallets;
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";
    limit = selectedWallet?.id.toString() == "-1" ? "0" : selectedWallet?.currency?.moneyRequestLimit ?? "";
    totalCharge = selectedWallet?.id.toString() == "-1" ? "0" : model.data?.transferCharge?.fixedCharge ?? "";
    String amt = amountController.text.toString();
    mainAmount = amt.isEmpty ? 0 : double.tryParse(amt) ?? 0;
    changeInfoWidget(mainAmount);
    update();
  }

  Future<void> loadData() async{
    isLoading = true;
    update();

    ResponseModel responseModel = await requestMoneyRepo.getWalletData();
    walletList.clear();

    amountController.text = "";
    requestToController.text = "";
    noteController.text = "";

    selectedWallet = Wallets(id: -1, currencyCode: MyStrings.selectWallet);
    walletList.insert(0, selectedWallet!);
    setWalletMethod(selectedWallet);

    if(responseModel.statusCode == 200){
      model = RequestMoneyResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){

        List<Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
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
  Future<void> submitRequest() async{

    submitLoading = true;
    update();

    String amount = amountController.text;
    String walletId = selectedWallet?.id.toString() ?? "";
    String username = requestToController.text;

    ResponseModel responseModel = await requestMoneyRepo.submitRequestMoney(walletId: walletId, amount: amount, username: username);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        Get.back();
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

  double mainAmount = 0;
  String charge = "";
  String payableText = '';
  void changeInfoWidget(double amount){
    if(selectedWallet?.id.toString() == "-1"){
      return ;
    }

    mainAmount = amount;
    double percent = double.tryParse(model.data?.transferCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount * percent) / 100;
    double temCharge = double.tryParse(model.data?.transferCharge?.fixedCharge ?? "0") ?? 0;
    double totalCharge = percentCharge+temCharge;
    charge = '${Converter.twoDecimalPlaceFixedWithoutRounding('$totalCharge')} $currency';
    double payable = totalCharge + amount;
    payableText = '$payable $currency';
    update();
  }
}
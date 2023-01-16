import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/money_discharge/money_out/money_out_response_model.dart';
import 'package:xcash_app/data/repo/money_discharge/money_out/money_out_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class MoneyOutController extends GetxController{

  MoneyOutRepo moneyOutRepo;
  MoneyOutController({required this.moneyOutRepo});

  bool isLoading = true;
  String currency = "";
  Wallets? walletsMethod = Wallets();
  String initialOtpType = "";
  String amount = "";
  String totalCharge = "";
  String payable = "";

  TextEditingController agentController = TextEditingController();
  TextEditingController amountController  = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setWalletMethod(Wallets? wallet){
    walletsMethod = wallet;
    update();
  }

  setOtpMethod(String? otp){
    initialOtpType = otp ?? "";
    update();
  }

  loadData() async{
    currency = moneyOutRepo.apiClient.getCurrencyOrUsername();
    isLoading = true;
    update();

    ResponseModel responseModel = await moneyOutRepo.getMoneyOutWallet();

    walletList.clear();
    otpTypeList.clear();
    amountController.text = "";
    agentController.text = "";

    Wallets wallets_ = Wallets(
      id: -2,
      currencyCode: MyStrings.selectAWallet
    );
    walletList.insert(0, wallets_);
    otpTypeList.insert(0, MyStrings.selectOtp);

    if(responseModel.statusCode == 200){
      MoneyOutResponseModel model = MoneyOutResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null || tempWalletList!.isNotEmpty){
          walletList.addAll(tempWalletList);
        }
        if(tempWalletList.isNotEmpty){
          walletsMethod = walletList[0];
          setWalletMethod(walletsMethod);
        }

        List<String>? tempOtpList = model.data?.otpType;
        if(tempOtpList != null || tempOtpList!.isNotEmpty){
          otpTypeList.addAll(tempOtpList);
        }
        if(tempOtpList.isNotEmpty){
          initialOtpType = otpTypeList[0];
          setOtpMethod(initialOtpType);
        }

        amount = amountController.text;
      }
    }
    else{
      CustomSnackBar.showCustomSnackBar(errorList: [responseModel.message], msg: [], isError: true);
    }

    isLoading = false;
    update();
  }

  bool submitLoading = false;
  void submitLoadingState(){
    submitLoading = !submitLoading;
    update();
  }
}
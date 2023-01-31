import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/money_discharge/money_out/money_out_response_model.dart';
import 'package:xcash_app/data/repo/money_discharge/money_out/money_out_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class MoneyOutController extends GetxController{

  MoneyOutRepo moneyOutRepo;
  MoneyOutController({required this.moneyOutRepo});

  bool isLoading = true;
  String currency = "";
  Wallets? selectedWallet = Wallets();
  String selectedOtp = "";
  String amount = "";
  String totalCharge = "";
  String payable = "";

  TextEditingController agentController = TextEditingController();
  TextEditingController amountController  = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setWalletMethod(Wallets? wallet){
    selectedWallet = wallet;
    update();
  }

  setOtpMethod(String? otp){
    selectedOtp = otp ?? "";
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
          selectedWallet = walletList[0];
          setWalletMethod(selectedWallet);
        }

        List<String>? tempOtpList = model.data?.otpType;
        if(tempOtpList != null || tempOtpList!.isNotEmpty){
          otpTypeList.addAll(tempOtpList);
        }
        if(tempOtpList.isNotEmpty){
          selectedOtp = otpTypeList[0];
          setOtpMethod(selectedOtp);
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
  Future<void> submitMoneyOut() async{
    submitLoading = true;
    update();

    String agentName = agentController.text;
    String walletId = selectedWallet?.id.toString()??'';
    String amount = amountController.text;
    String otpType = selectedOtp.toLowerCase().toString();

    ResponseModel response = await moneyOutRepo.submitMoneyOut(walletId: walletId, amount: amount, agent: agentName, otpType: otpType);
    if(response.statusCode==200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(response.responseJson));
      if(model.status?.toLowerCase()=='success'){
        String actionId = model.data?.actionId??'';
        if(actionId.isNotEmpty){
          Get.toNamed(RouteHelper.otpScreen, arguments: [actionId, RouteHelper.bottomNavBar]);
        }
        else{
          CustomSnackBar.error(errorList: [MyStrings.noActionId]);
        }

      } else{

      }
    } else{
      CustomSnackBar.error(errorList: [response.message]);
    }

    submitLoading = false;
    update();
  }
}
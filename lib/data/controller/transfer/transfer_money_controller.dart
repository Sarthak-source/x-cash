import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/transfer/transfer_money_response_model.dart' as tm_model;
import 'package:xcash_app/data/repo/transfer/transfer_money_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class TransferMoneyController extends GetxController{

  TransferMoneyRepo transferMoneyRepo;
  TransferMoneyController({required this.transferMoneyRepo});

  bool isLoading = true;
  String currency = "";

  tm_model.TransferMoneyResponseModel model = tm_model.TransferMoneyResponseModel();
  tm_model.Wallets? selectedWallet = tm_model.Wallets();

  String selectedOtp = "";

  TextEditingController amountController = TextEditingController();
  TextEditingController receiverController = TextEditingController();

  List<tm_model.Wallets> walletList = [];
  List<String> otpTypeList = [];

  setSelectedWallet(tm_model.Wallets? wallet){
    selectedWallet = wallet;
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";
    update();
  }

  setSelectedOtp(String? otp){
    selectedOtp = otp ?? "";
    update();
  }

  Future<void> loadData() async{
    isLoading = true;
    update();

    walletList.clear();
    otpTypeList.clear();
    amountController.text = "";
    receiverController.text = "";

    selectedWallet = tm_model.Wallets(id: -1, currencyCode: MyStrings.selectAWallet);
    walletList.insert(0, selectedWallet!);
    setSelectedWallet(selectedWallet);

    otpTypeList.insert(0, MyStrings.selectOtp);

    ResponseModel responseModel = await transferMoneyRepo.getWalletsData();
    if(responseModel.statusCode == 200){
      model = tm_model.TransferMoneyResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<tm_model.Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
        }

        List<String>? tempOtpList = model.data?.otpType;
        if(tempOtpList != null || tempOtpList!.isNotEmpty){
          otpTypeList.addAll(tempOtpList);
        }
        if(tempOtpList.isNotEmpty){
          selectedOtp = otpTypeList[0];
          setSelectedOtp(selectedOtp);
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
  Future<void> submitTransferMoney() async{
    submitLoading = true;
    update();

    String receiverName = receiverController.text;
    String walletId = selectedWallet?.id.toString() ?? "";
    String amount = amountController.text;
    String otpType = selectedOtp.toString().toLowerCase();

    ResponseModel responseModel = await transferMoneyRepo.submitTransferMoney(walletId: walletId, amount: amount, username: receiverName, otpType: otpType);
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
}
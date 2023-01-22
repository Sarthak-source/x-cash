import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/voucher/create_voucher_response_model.dart';
import 'package:xcash_app/data/repo/voucher/create_voucher_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class CreateVoucherController extends GetxController{

  CreateVoucherRepo createVoucherRepo;
  CreateVoucherController({required this.createVoucherRepo});

  bool isLoading = false;
  String currency = "";

  CreateVoucherResponseModel model = CreateVoucherResponseModel();
  Wallets? selectedWallet = Wallets();

  String selectedOtp = "";
  String amount = "";

  TextEditingController amountController = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setSelectedWallet(Wallets? wallet){
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

    selectedWallet = Wallets(id: -1, currencyCode: MyStrings.selectAWallet);
    walletList.insert(0, selectedWallet!);
    setSelectedWallet(selectedWallet);

    otpTypeList.insert(0, MyStrings.selectOtp);

    ResponseModel responseModel = await createVoucherRepo.getCreateVoucherData();
    if(responseModel.statusCode == 200){
      model = CreateVoucherResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Wallets>? tempWalletList = model.data?.wallets;
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
}
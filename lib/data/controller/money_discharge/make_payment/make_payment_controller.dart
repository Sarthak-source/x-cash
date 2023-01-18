import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/make_payment_response_model.dart';
import 'package:xcash_app/data/repo/money_discharge/make_payment/make_payment_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class MakePaymentController extends GetxController{

  MakePaymentRepo makePaymentRepo;
  MakePaymentController({required this.makePaymentRepo});

  bool isLoading = true;
  String currency = "";
  Wallets? walletsMethod = Wallets();
  String selectedOtp = "";
  String amount = "";
  String totalCharge = "";
  String payable = "";

  TextEditingController merchantController = TextEditingController();
  TextEditingController amountController  = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setWalletMethod(Wallets? wallet){
    walletsMethod = wallet;
    currency = walletsMethod?.id == -1 ? "" : walletsMethod?.currencyCode ?? "";
    update();
  }

  setOtpMethod(String? otp){
    selectedOtp = otp ?? "";
    update();
  }

  loadData() async{
    currency = makePaymentRepo.apiClient.getCurrencyOrUsername();
    isLoading = true;
    update();

    ResponseModel responseModel = await makePaymentRepo.getMakePaymentWallet();

    walletList.clear();
    otpTypeList.clear();
    amountController.text = "";
    merchantController.text = "";

    walletsMethod = Wallets(id: -1, currencyCode: MyStrings.selectAWallet);
    walletList.insert(0, walletsMethod!);
    setWalletMethod(walletsMethod);

    otpTypeList.insert(0, MyStrings.selectOtp);

    if(responseModel.statusCode == 200){
      MakePaymentResponseModel model = MakePaymentResponseModel.fromJson(jsonDecode(responseModel.responseJson));

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
  void submitPayment() async{

    submitLoading = true;
    update();

    String merchantName = merchantController.text;
    String walletId = walletsMethod?.id.toString()??'';
    String amount = amountController.text;
    String otpType = selectedOtp.toLowerCase().toString();

    ResponseModel response = await makePaymentRepo.submitPayment(walletId: walletId,amount: amount,merchant: merchantName,otpType: otpType);
    print(response.responseJson);
    if(response.statusCode==200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(response.responseJson));
      if(model.status?.toLowerCase()=='success'){
        String actionId = model.data?.actionId??'';
        if(actionId.isNotEmpty){
          Get.toNamed(RouteHelper.otpScreen,arguments: [actionId,RouteHelper.bottomNavBar]);
        } else{
          CustomSnackBar.error(errorList: [MyStrings.noActionid]);
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
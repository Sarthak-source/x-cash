import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/check_merchant_response_model.dart';
import 'package:xcash_app/data/model/money_discharge/make_payment/make_payment_response_model.dart';
import 'package:xcash_app/data/repo/money_discharge/make_payment/make_payment_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

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
  MakePaymentResponseModel model = MakePaymentResponseModel();

  TextEditingController merchantController = TextEditingController();
  TextEditingController amountController  = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setWalletMethod(Wallets? wallet){
    walletsMethod = wallet;
    currency = walletsMethod?.id == -1 ? "" : walletsMethod?.currencyCode ?? "";
    String amt = amountController.text.toString();
    mainAmount = amt.isEmpty ? 0 : double.tryParse(amt) ?? 0;
    changeInfoWidget(mainAmount);
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
      model = MakePaymentResponseModel.fromJson(jsonDecode(responseModel.responseJson));

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
      CustomSnackBar.error(errorList: [responseModel.message]);
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
    if(response.statusCode==200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(response.responseJson));
      if(model.status?.toLowerCase()=='success'){
        String actionId = model.data?.actionId??'';
        if(actionId.isNotEmpty){
          Get.toNamed(RouteHelper.otpScreen,arguments: [actionId, RouteHelper.bottomNavBar]);
        } else{
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

  double mainAmount = 0;
  String charge = "";
  String payableText = '';
  void changeInfoWidget(double amount){
    if(walletsMethod?.id.toString() == "-1"){
      return ;
    }

    mainAmount = amount;
    double percent = double.tryParse(model.data?.paymentCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount * percent) / 100;
    double temCharge = double.tryParse(model.data?.paymentCharge?.fixedCharge ?? "0") ?? 0;
    double totalCharge = percentCharge+temCharge;
    charge = '${Converter.twoDecimalPlaceFixedWithoutRounding('$totalCharge')} $currency';
    double payable = totalCharge + amount;
    payableText = '$payable $currency';
    update();
  }

  bool hasAgent = false;
  String validMerchant = "";
  String invalidMerchant = "";
  bool? isAgentFound;
  Future<void> checkMerchantFocus(bool hasFocus) async{
    hasAgent = hasFocus;
    update();

    String merchant = merchantController.text;
    ResponseModel responseModel = await makePaymentRepo.checkMerchant(merchant: merchant);
    if(responseModel.statusCode == 200){
      CheckMerchantResponseModel model = CheckMerchantResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        isAgentFound = true;
        validMerchant = MyStrings.validMerchantMsg;
        update();
      }
      else{
        isAgentFound = false;
        invalidMerchant = MyStrings.invalidMerchantMsg;
        update();
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }
}
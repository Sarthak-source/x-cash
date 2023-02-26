import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/money_discharge/money_out/check_agent_response_model.dart';
import 'package:xcash_app/data/model/money_discharge/money_out/money_out_response_model.dart';
import 'package:xcash_app/data/repo/money_discharge/money_out/money_out_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

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
  String minLimit = "";
  String maxLimit = "";

  MoneyOutResponseModel model = MoneyOutResponseModel();

  TextEditingController agentController = TextEditingController();
  TextEditingController amountController  = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setWalletMethod(Wallets? wallet){
    selectedWallet = wallet;
    minLimit = Converter.twoDecimalPlaceFixedWithoutRounding(selectedWallet?.id == -1 ? "0" : selectedWallet?.currency?.moneyOutMinLimit.toString() ?? "");
    maxLimit = Converter.twoDecimalPlaceFixedWithoutRounding(selectedWallet?.id == -1 ? "0" : selectedWallet?.currency?.moneyOutMaxLimit.toString() ?? "");
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";
    update();
  }

  setOtpMethod(String? otp){
    selectedOtp = otp ?? "";
    update();
  }

  loadData(String? userType) async{
    isLoading = true;
    update();

    ResponseModel responseModel = await moneyOutRepo.getMoneyOutWallet();

    walletList.clear();
    otpTypeList.clear();
    amountController.text = "";
    agentController.text = userType ?? "";

    selectedWallet = Wallets(id: -1, currencyCode: MyStrings.selectAWallet);
    walletList.insert(0, selectedWallet!);
    setWalletMethod(selectedWallet);

    otpTypeList.insert(0, MyStrings.selectOtp);

    if(responseModel.statusCode == 200){
      model = MoneyOutResponseModel.fromJson(jsonDecode(responseModel.responseJson));
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
    if(selectedWallet?.id.toString() == "-1"){
      return ;
    }
    mainAmount = amount;
    double percent = double.tryParse(model.data?.moneyOutCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount * percent) / 100;
    double temCharge = double.tryParse(model.data?.moneyOutCharge?.fixedCharge ?? "0") ?? 0;
    double totalCharge = percentCharge+temCharge;
    charge = '${Converter.twoDecimalPlaceFixedWithoutRounding('$totalCharge')} $currency';
    double payable = totalCharge + amount;
    payableText = '$payable $currency';
    update();
  }

  bool hasAgent = false;
  String validAgent = "";
  String invalidAgent = "";
  bool? isAgentFound;
  Future<void> checkAgentFocus(bool hasFocus) async{
    hasAgent = hasFocus;
    update();

    String agent = agentController.text;
    ResponseModel responseModel = await moneyOutRepo.checkAgent(agent: agent);
    if(responseModel.statusCode == 200){
      CheckAgentResponseModel model = CheckAgentResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        isAgentFound = true;
        validAgent = MyStrings.validAgentMsg;
        update();
      }
      else{
        isAgentFound = false;
        invalidAgent = MyStrings.invalidAgentMsg;
        update();
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }
}
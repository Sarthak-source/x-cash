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
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/widget/money_out_bottom_sheet.dart';

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
    minLimit = Converter.formatNumber(selectedWallet?.id == -1 ? "0" : selectedWallet?.currency?.moneyOutMinLimit.toString() ?? "",precision: selectedWallet?.currency?.currencyType=='2'?8:2);
    maxLimit = Converter.formatNumber(selectedWallet?.id == -1 ? "0" : selectedWallet?.currency?.moneyOutMaxLimit.toString() ?? "",precision: selectedWallet?.currency?.currencyType=='2'?8:2);
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";
    changeInfoWidget(double.tryParse(amountController.text)??0);
    update();
  }

  setOtpMethod(String? otp){
    selectedOtp = otp ?? "";
    update();
  }

  loadData(String userType) async{
    isLoading = true;
    update();

    ResponseModel responseModel = await moneyOutRepo.getMoneyOutWallet();


    hasAgent     = false;
    validAgent   = "";
    invalidAgent = "";
    isAgentFound = false;

    walletList.clear();
    otpTypeList.clear();
    amountController.text = "";
    agentController.text = userType;

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
      else{
        CustomSnackBar.error(errorList: model.message?.error??[MyStrings.requestFail]);
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
          Get.toNamed(RouteHelper.otpScreen, arguments: [actionId, RouteHelper.bottomNavBar,otpType]);
        }
        else{
          Get.offAndToNamed(RouteHelper.bottomNavBar);
          CustomSnackBar.success(successList: model.message?.success??[MyStrings.requestSuccess]);
        }
      } else{
        CustomSnackBar.error(errorList: model.message?.error??[MyStrings.requestFail]);
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
    double currencyRate  = double.tryParse(selectedWallet?.currency?.rate??'1')??1;

    double percent       = double.tryParse(model.data?.moneyOutCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount*percent)/100;

    double fixed         = double.tryParse(model.data?.moneyOutCharge?.fixedCharge ?? "0") ?? 0;
    double fixedCharge   = fixed/currencyRate;  //fixed charge are  global for each currency so that we don't calculate it with expected currency

    double finalCharge   = fixedCharge + percentCharge;
    charge               = '${Converter.formatNumber('$finalCharge',precision: selectedWallet?.currency?.currencyType=='2'?8:2)} $currency';
    String payable       = Converter.sum(finalCharge.toString(),mainAmount.toString(),precision: selectedWallet?.currency?.currencyType=='2'?8:2);
    payableText          = '$payable $currency';
    update();
  }


  bool hasAgent       = false;
  String validAgent   = "";
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

  void checkAndShowPreviewSheet(BuildContext context){

    if(agentController.text.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.agentUsernameHint.tr]);
      return ;
    }

    else if(selectedWallet?.id.toString() == "-1"){
      CustomSnackBar.error(errorList: [MyStrings.selectAWallet.tr]);
      return ;
    }

    else if(amountController.text.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.enterAmountMsg.tr]);
      return ;
    }

    else{
      CustomBottomSheet(child: const MoneyOutBottomSheet()).customBottomSheet(context);
    }
  }
}
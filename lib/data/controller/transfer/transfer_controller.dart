import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/general_setting/general_settings_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/profile/profile_response_model.dart';
import 'package:xcash_app/data/repo/account/profile_repo.dart';
import 'package:xcash_app/data/repo/balance_transfer_repo/balance_transfer_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class BalanceTransferController extends GetxController {

  BalanceTransferRepo repo;
  ProfileRepo profileRepo;
  BalanceTransferController({required this.repo,required this.profileRepo});

  bool isLoading = true;
  String currency = '';
  double fixedAmount = 0.0;
  double percentAmount = 0.0;
  String amtText = '';



  Future<void>loadData()async{
    isLoading = true;
    update();
    clearInputField();
    GeneralSettingsResponseModel model = repo.apiClient.getGSData();
    fixedAmount = double.tryParse(model.data?.generalSetting?.fCharge??'0.0')??0.0;
    percentAmount = double.tryParse(model.data?.generalSetting?.pCharge??'1')??1;
    amtText = '(${MyStrings.charge.tr}: $fixedAmount $currency + $percentAmount%)';
    currency = repo.apiClient.getCurrencyOrUsername();
    await checkTwoFactorStatus();
    isLoading = false;
    update();
  }

  bool isTFAEnable = false;
  Future<void>checkTwoFactorStatus()async{
    ProfileResponseModel model = await profileRepo.loadProfileInfo();
    if(model.status?.toLowerCase()==MyStrings.success.toLowerCase()){
     isTFAEnable = model.data?.user?.ts=='1'?true:false;
    }
  }


  TextEditingController usernameController    = TextEditingController();
  TextEditingController amountController      = TextEditingController();
  TextEditingController twoFactorController   = TextEditingController();

  List<String>walletList = [MyStrings.selectAWallet.tr,MyStrings.depositWallet.tr,MyStrings.interestWallet.tr];
  String selectedWallet = MyStrings.selectAWallet;

  void changeWallet(String value){
    selectedWallet = value;
    update();
  }

  String chargeText = '';
  changeTotalAmount(String text){
    if(text.isEmpty){
      chargeText = '';
    }else{
      double amount = double.tryParse(text)??0;
      double percent = (amount*percentAmount)/100;
      double subTotal = amount+fixedAmount+percent;
      chargeText = '$subTotal $currency ${MyStrings.chargeMsg2.tr}';
    }
    update();
  }


  String twoFactorCode = '';
  bool submitLoading = false;
  Future<void>submitBalanceTransfer()async{
    String username = usernameController.text;
    String amount   = amountController.text.toString();

    if(username.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.usernameEmptyMsg.tr]);
      return;
    }

    if(amount.isEmpty){
      CustomSnackBar.error(errorList: [(MyStrings.invalidAmount.tr)]);
      return;
    }

    submitLoading = true;
    update();
    String wallet = selectedWallet.toLowerCase().replaceAll(' ', '_');
    ResponseModel response = await repo.transferBalance(username, amount, wallet,twoFactorCode);
    if(response.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(response.responseJson));
      if(model.status?.toLowerCase() == MyStrings.success.toLowerCase()){
        clearInputField();
        CustomSnackBar.success(successList: model.message?.success??[MyStrings.requestSuccess],);
      }else{
        CustomSnackBar.error(errorList:  model.message?.error??[MyStrings.requestFail]);
      }
    }else{
      CustomSnackBar.error(errorList: [response.message]);
    }

    submitLoading = false;
    update();

  }

  void clearInputField(){
    amountController.clear();
    usernameController.clear();
    twoFactorController.clear();
    twoFactorCode = '';
    selectedWallet = walletList[0];
    chargeText = '';
    update();
  }



}
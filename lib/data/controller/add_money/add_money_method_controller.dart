import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/add_money/add_money_method_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/repo/add_money/add_money_method_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class AddMoneyMethodController extends GetxController{

  AddMoneyMethodRepo addMoneyMethodRepo;
  AddMoneyMethodController({required this.addMoneyMethodRepo});

  bool isLoading = true;
  String currency = "";
  AddMoneyWallets? selectedWallet = AddMoneyWallets();
  Gateways? selectedGateway = Gateways();
  String initialOtpType = "";
  String depositLimit = "";

  TextEditingController amountController = TextEditingController();
  String amount = "";

  List<AddMoneyWallets> walletList = [];
  List<Gateways> gatewayList = [];

  setWallet(AddMoneyWallets? addMoneyWallets){
    selectedWallet = addMoneyWallets;
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";

    //change wallet gateway
    List<Gateways> tempGatewayList = addMoneyWallets?.currency?.gateways ?? [];
    gatewayList.clear();
    if(tempGatewayList.isNotEmpty){
      gatewayList.addAll(tempGatewayList);
    }
    gatewayList.insert(0, gateways);

    setGatewayMethod(gatewayList[0]);

    update();
  }

  setGatewayMethod(Gateways? gateways){
      selectedGateway = gateways;
      depositLimit = selectedGateway == gatewayList[0] ? "0.00 $currency": selectedGateway?.depositLimit ?? "0.00";
      update();
  }


  Gateways gateways = Gateways(id: -1, name: MyStrings.selectGateway);

  loadData() async{
    walletList.clear();
    gatewayList.clear();

    amountController.text = "";

    selectedWallet = AddMoneyWallets(id: -1, currencyCode: MyStrings.selectWallet);


    walletList.insert(0, selectedWallet!);
    setWallet(selectedWallet);

    ResponseModel responseModel = await addMoneyMethodRepo.getAddMoneyMethodData();
    if(responseModel.statusCode == 200){
      AddMoneyMethodResponseModel model = AddMoneyMethodResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if(model.message != null && model.message?.success != null){

        List<AddMoneyWallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
        }
      }
      else{
        CustomSnackBar.showCustomSnackBar(errorList: model.message?.error ?? [MyStrings.somethingWentWrong], msg: [], isError: true);
      }
    }
    else{
      CustomSnackBar.showCustomSnackBar(errorList: [responseModel.message], msg: [], isError: true);
    }

    isLoading = false;
    update();
  }

  bool submitLoading = false;
  Future<void> submitData() async{

  }
}
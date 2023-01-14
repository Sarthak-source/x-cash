import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/add_money/add_money_insert_response_model.dart';
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

  double mainAmount = 0;

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
      String amt = amountController.text.toString();
      mainAmount = amt.isEmpty ? 0 : double.tryParse(amt) ?? 0;
      selectedGateway = gateways;
      depositLimit = selectedGateway == gatewayList[0] ? "0.00 $currency": selectedGateway?.depositLimit ?? "0.00";
      changeInfoWidgetValue(mainAmount);
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

    if(selectedWallet?.id.toString() == "-1"){
      CustomSnackBar.error(errorList: [MyStrings.selectAWallet]);
      return ;
    }

    if(selectedGateway?.id.toString() == "-1"){
      CustomSnackBar.error(errorList: [MyStrings.selectGateway]);
      return ;
    }

    String amount = amountController.text.toString();

    submitLoading = true;
    update();

    ResponseModel responseModel = await addMoneyMethodRepo.insertMoney(
        amount: amount,
        methodCode: selectedGateway?.methodCode ?? "",
        walletId: selectedWallet?.id.toString() ?? ""
    );

    if(responseModel.statusCode == 200){
      AddMoneyInsertResponseModel model = AddMoneyInsertResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        showWebView(model.data?.redirectUrl ?? "");
      }
      else {
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    submitLoading = false;
    update();
  }

  String charge = "";
  String payable = "";
  String payableText = '';
  void changeInfoWidgetValue(double amount){
    if(selectedGateway?.id.toString() == "-1"){
      return ;
    }
    mainAmount = amount;
    double percent = double.tryParse(selectedGateway?.percentCharge??'0')??0;
    double percentCharge = (amount * percent) / 100;
    double temCharge = double.tryParse(selectedGateway?.fixedCharge??'0')??0;
    double totalCharge = percentCharge+temCharge;
    charge = '${Converter.twoDecimalPlaceFixedWithoutRounding('$totalCharge')} $currency';
    double payable = totalCharge + amount;
    payableText = '$payable $currency';
    update();
  }

  void showWebView(String redirectUrl) {
    Get.offAndToNamed(RouteHelper.depositWebScreen, arguments: redirectUrl);
  }
}
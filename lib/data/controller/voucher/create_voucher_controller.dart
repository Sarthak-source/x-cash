import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/voucher/create_voucher_response_model.dart';
import 'package:xcash_app/data/repo/voucher/create_voucher_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class CreateVoucherController extends GetxController{

  CreateVoucherRepo createVoucherRepo;
  CreateVoucherController({required this.createVoucherRepo});

  bool isLoading = false;
  String currency = "";

  CreateVoucherResponseModel model = CreateVoucherResponseModel();
  Wallets? selectedWallet = Wallets();

  String selectedOtp = "";
  String amount = "";

  String minLimit = "";
  String maxLimit = "";

  TextEditingController amountController = TextEditingController();

  List<Wallets> walletList = [];
  List<String> otpTypeList = [];

  setSelectedWallet(Wallets? wallet){
    selectedWallet = wallet;
    currency = selectedWallet?.id == -1 ? "" : selectedWallet?.currencyCode ?? "";
    String amt = amountController.text.toString();
    mainAmount = amt.isEmpty ? 0 : double.tryParse(amt) ?? 0;
    changeInfoWidget(mainAmount);
    minLimit = Converter.twoDecimalPlaceFixedWithoutRounding(selectedWallet?.id.toString() == "-1" ? "0" : selectedWallet?.currency?.voucherMinLimit ?? "");
    maxLimit = Converter.twoDecimalPlaceFixedWithoutRounding(selectedWallet?.id.toString() == "-1" ? "0" : selectedWallet?.currency?.voucherMaxLimit ?? "");
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
  Future<void> submitCreateVoucher() async{
    submitLoading = true;
    update();

    String walletId = selectedWallet?.id.toString()??'';
    String amount = amountController.text;
    String otpType = selectedOtp.toLowerCase().toString();

    ResponseModel response = await createVoucherRepo.submitCreateVoucher(amount: amount, walletId: walletId, otpType: otpType);
    if(response.statusCode==200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(response.responseJson));
      if(model.status?.toLowerCase()=='success'){
        String actionId = model.data?.actionId??'';
        if(actionId.isNotEmpty){
          Get.toNamed(RouteHelper.otpScreen,arguments: [actionId, RouteHelper.myVoucherScreen]);
        } else{
          CustomSnackBar.error(errorList: [MyStrings.noActionId]);
        }
      }
      else{
          CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
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
    double percent = double.tryParse(model.data?.voucherCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount * percent) / 100;
    double temCharge = double.tryParse(model.data?.voucherCharge?.fixedCharge ?? "0") ?? 0;
    double totalCharge = percentCharge+temCharge;
    charge = '${Converter.twoDecimalPlaceFixedWithoutRounding('$totalCharge')} $currency';
    double payable = totalCharge + amount;
    payableText = '$payable $currency';
    update();
  }
}
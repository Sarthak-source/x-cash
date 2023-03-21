import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/general_setting/general_setting_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/voucher/create_voucher_response_model.dart';
import 'package:xcash_app/data/repo/voucher/create_voucher_repo.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/widget/create_voucher_bottom_sheet.dart';

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
    minLimit = Converter.formatNumber(selectedWallet?.id.toString() == "-1" ? "0" : selectedWallet?.currency?.voucherMinLimit ?? "");
    maxLimit = Converter.formatNumber(selectedWallet?.id.toString() == "-1" ? "0" : selectedWallet?.currency?.voucherMaxLimit ?? "");
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
          CustomSnackBar.success(successList: model.message?.success??[MyStrings.requestSuccess]);
          Get.toNamed(RouteHelper.myVoucherScreen);
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
    double currencyRate = double.tryParse(selectedWallet?.currency?.rate ?? '1')??1;

    double percent = double.tryParse(model.data?.voucherCharge?.percentCharge ?? "0") ?? 0;
    double percentCharge = (amount*percent)/100;

    double fixed = double.tryParse(model.data?.voucherCharge?.fixedCharge ?? "0") ?? 0;
    double fixedCharge = fixed/currencyRate;  //fixed charge are  global for each currency so that we don't calculate it with expected currency

    double finalCharge = fixedCharge + percentCharge;
    charge = '${Converter.formatNumber('$finalCharge',precision:selectedWallet?.currency?.currencyType=='2'?8:2)} $currency';
    String payable = Converter.sum(finalCharge.toString(),mainAmount.toString());
    payableText = '$payable $currency';

    update();
  }

  void checkAndShowPreviewBottomSheet(BuildContext context) {
    if(selectedWallet?.id.toString() == "-1"){
      CustomSnackBar.error(errorList: [MyStrings.selectAWallet]);
      return ;
    }
    if(amountController.text.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.enterAmountMsg]);
      return ;
    }
    else{
      CustomBottomSheet(
          child: const CreateVoucherBottomSheet()
      ).customBottomSheet(context);
    }
  }
}
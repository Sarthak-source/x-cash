
import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/withdraw/withdraw_preview_response_model.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import '../../repo/withdraw/withdraw_money_repo.dart';

class WithdrawPreviewController extends GetxController{

  WithdrawMoneyRepo repo;
  WithdrawPreviewController({required this.repo});

  bool isLoading = true;

  String withdrawCharge = "";
  String youWillGet = "";
  String balanceWillBe = "";
  String selectedOtp = MyStrings.selectOtp;
  String remainingBalance = "";

  String currency = "";

  List<String> otpTypeList = [];

  WithdrawPreviewResponseModel model = WithdrawPreviewResponseModel();

  setSelectedOTP(String? otp){
    selectedOtp = otp ?? "";
    update();
  }

  Future <void> loadData(String trxId) async {
    isLoading = true;
    update();

    ResponseModel responseModel = await repo.getPreviewData(trx: trxId);
    otpTypeList.clear();

    otpTypeList.insert(0, MyStrings.selectOtp);

    if(responseModel.statusCode == 200){
      model = WithdrawPreviewResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        currency = model.data?.withdraw?.currency ?? "";
        withdrawCharge = model.data?.withdraw?.charge ?? "";
        youWillGet = model.data?.withdraw?.finalAmount ?? "";
        remainingBalance = Converter.formatNumber(model.data?.remainingBalance ?? "");

        List<String>? tempOtpList = model.data?.otpType;
        if(tempOtpList != null || tempOtpList!.isNotEmpty){
          otpTypeList.addAll(tempOtpList);
        }
        if(tempOtpList.isNotEmpty){
          selectedOtp = otpTypeList[0];
          setSelectedOTP(selectedOtp);
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
  Future<void> submitMoney({required String trxId}) async{

    submitLoading = true;
    update();

    String otpType = selectedOtp.toString().toLowerCase();

    ResponseModel  responseModel = await repo.submitData(otpType: otpType, trx: trxId);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        String actionId = model.data?.actionId ?? "";

        if(actionId.isNotEmpty){
          Get.offAndToNamed(RouteHelper.otpScreen, arguments: [actionId, RouteHelper.withdrawHistoryScreen,otpType]);
        }
        else{
          Get.offAndToNamed(RouteHelper.withdrawHistoryScreen);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    submitLoading = false;
    update();
  }
}
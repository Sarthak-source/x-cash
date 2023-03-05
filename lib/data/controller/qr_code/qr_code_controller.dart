import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/qr_code/qr_code_response_model.dart';
import 'package:xcash_app/data/model/qr_code/qr_code_scan_response_model.dart';
import 'package:xcash_app/data/repo/qr_code/qr_code_repo.dart';
import 'package:xcash_app/view/components/file_download_dialog/download_dialogue.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:dio/dio.dart';

class QrCodeController extends GetxController{

  QrCodeRepo qrCodeRepo;
  QrCodeController({required this.qrCodeRepo});

  bool isLoading = true;
  QrCodeResponseModel model = QrCodeResponseModel();

  String qrCode = "";
  String username = '';

  Future<void> loadData() async{
    username = qrCodeRepo.apiClient.getCurrencyOrUsername(isCurrency: false);
    isLoading = true;
    update();

    ResponseModel responseModel = await qrCodeRepo.getQrData();
    if(responseModel.statusCode == 200){
      model = QrCodeResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == "success"){
        qrCode = model.data?.qrCode ?? "";
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.requestFail]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  Future<void> downloadImage() async {
    //

    String imageUrl = model.data?.qrCode ?? "";
    if(imageUrl.isNotEmpty && imageUrl != 'null'){
      showDialog(
        context: Get.context!,
        builder: (context) => DownloadingDialog(isPdf:false,url: 'https://sohan.thesoftking.com/xcash/v4/assets/images/temporary/agent_qr_code_1.jpg',fileName: 'agent_qr_code_1.jpg',),
      );
      update();
    }
  }

  bool isScannerLoading = false;
  Future<bool> submitQrData(String scannedData) async{

    print("Scan Data: $scannedData");
    isScannerLoading = true;
    update();

    bool requestStatus = false;

    ResponseModel responseModel = await qrCodeRepo.qrCodeScan(scannedData);
    if(responseModel.statusCode == 200){
      QrCodeScanResponseModel scanModel = QrCodeScanResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(scanModel.status.toString().toLowerCase() == "success"){
        String userType = scanModel.data?.userType ?? "";
        String userName = scanModel.data?.userData?.username ?? "";
        if(userType.toLowerCase()=='agent'){
          Get.offAndToNamed(RouteHelper.moneyOutScreen, arguments: userName);
        } else if(userType.toLowerCase()=='merchant'){
          Get.offAndToNamed(RouteHelper.makePaymentScreen, arguments:userName);
        } else if(userType.toLowerCase()=='user'){
          Get.offAndToNamed(RouteHelper.transferMoneyScreen, arguments: userName);
        } else{
          Get.back();
          CustomSnackBar.error(errorList: [MyStrings.invalidUserType]);
        }

      }
      else{
        requestStatus = false;
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.requestFail]);
      }
    }
    else{
      requestStatus = false;
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isScannerLoading = false;
    update();

    return requestStatus;
  }
}
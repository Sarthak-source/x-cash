import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/qr_code/qr_code_response_model.dart';
import 'package:xcash_app/data/repo/qr_code/qr_code_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class QrCodeController extends GetxController{

  QrCodeRepo qrCodeRepo;
  QrCodeController({required this.qrCodeRepo});

  bool isLoading = true;
  QrCodeResponseModel model = QrCodeResponseModel();

  String qrCode = "";

  Future<void> loadData() async{
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
}
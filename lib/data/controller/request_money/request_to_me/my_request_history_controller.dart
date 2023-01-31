import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/request_money/my_request_response_model.dart' as rq_model;
import 'package:xcash_app/data/repo/request_money/my_request_history_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class MyRequestHistoryController extends GetxController{

  MyRequestHistoryRepo myRequestHistoryRepo;
  MyRequestHistoryController({required this.myRequestHistoryRepo});

  bool isLoading = true;
  rq_model.MyRequestResponseModel model = rq_model.MyRequestResponseModel();

  List<rq_model.Data> myRequestList = [];

  String? nextPageUrl;
  int page = 0;

  void initialStateData() async{
    page = 0;
    myRequestList.clear();
    isLoading = true;
    update();

    await loadHistoryData();
    isLoading = false;
    update();
  }

  Future<void> loadHistoryData() async{
    page = page + 1;
    if(page == 1){
      myRequestList.clear();
    }

    ResponseModel responseModel = await myRequestHistoryRepo.getHistoryData(page,isMyRequest: isMyRequest);
    if(responseModel.statusCode == 200){
      model = rq_model.MyRequestResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.requests?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<rq_model.Data>? tempMyRequestList = model.data?.requests?.data;
        if(tempMyRequestList != null && tempMyRequestList.isNotEmpty){
          myRequestList.addAll(tempMyRequestList);
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

  bool hasNext(){
    return nextPageUrl !=null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }

  bool isMyRequest = true;
  void changeTabState(bool status)async{
    isMyRequest = status;
    isLoading = true;
    update();
    page = 0;
    myRequestList.clear();
    await loadHistoryData();
    isLoading = false;
    update();
  }

  bool submitLoading = false;
  Future<void> requestReject(String requestId) async{
    submitLoading = true;
    update();

    ResponseModel responseModel = await myRequestHistoryRepo.requestReject(requestId: requestId);
    if(responseModel.statusCode == 200){
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        Get.back();
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);
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
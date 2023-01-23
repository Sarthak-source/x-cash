import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/request_money/my_request_response_model.dart';
import 'package:xcash_app/data/repo/request_money/my_request_history_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class MyRequestHistoryController extends GetxController{

  MyRequestHistoryRepo myRequestHistoryRepo;
  MyRequestHistoryController({required this.myRequestHistoryRepo});

  bool isLoading = true;
  MyRequestResponseModel model = MyRequestResponseModel();

  List<Data> myRequestList = [];

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
      model = MyRequestResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.requests?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempMyRequestList = model.data?.requests?.data;
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
}
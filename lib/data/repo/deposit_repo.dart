import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/authorized/deposit/deposit_history_response_model.dart';
import 'package:xcash_app/data/model/authorized/deposit/deposit_insert_method.dart';
import 'package:xcash_app/data/model/authorized/deposit/deposit_insert_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class DepositRepo{
  ApiClient apiClient;
  DepositRepo({required this.apiClient});
  Future<dynamic> getDepositHistory({int page=-1,bool isSearch=false,String? trx='-1'}) async{

    Map<String, dynamic> params = isSearch?{'search': trx}:{'page':page};

    String url='${UrlContainer.baseUrl}${UrlContainer.depositHistoryUrl}${isSearch?'?search=$trx':'?page=$page'}';
    ResponseModel response= await apiClient.request(url, Method.getMethod, params,passHeader: true);

    if (kDebugMode) {
      print(response.responseJson);
      print(response.statusCode);
    }

    if(response.statusCode==200){
      DepositHistoryResponseModel model = DepositHistoryResponseModel.fromJson(jsonDecode(response.responseJson));
      if (!(model.status=='error')) {
        return model;
      } else {
        CustomSnackBar.showCustomSnackBar(errorList: model.message?.error??['Unknown Validation Error'], msg: [], isError: true);
        return model;
      }
    }
    else{
      return DepositHistoryResponseModel();
    }

  }

  Future<dynamic>getDepositMethod() async {

    String url='${UrlContainer.baseUrl}${UrlContainer.depositMethodUrl}';
    ResponseModel response= await apiClient.request(url, Method.getMethod, null,passHeader: true);
    return response;
  }


  Future<dynamic>insertDeposit(DepositInsertModel model)async{

    String url='${UrlContainer.baseUrl}${UrlContainer.depositInsertUrl}';

    Map<String,dynamic>param={
      'method_code':model.methodCode.toString(),
      'amount':model.amount.toString(),
      'currency':model.currency
    };

    ResponseModel response= await apiClient.request(url, Method.postMethod, param,passHeader: true);

    if(response.statusCode==200){

      DepositInsertResponseModel model = DepositInsertResponseModel.fromJson(jsonDecode(response.responseJson));

      if (model.message?.success!=null) {
        return model;
      }
      else {
        CustomSnackBar.showCustomSnackBar(
            errorList: model.message?.error??[MyStrings.somethingWentWrong.tr],
            msg: [],
            isError: true);
        return model;
      }
    }else{
      return DepositInsertResponseModel();
    }
  }

  Future<dynamic>getUserInfo() async {
    String url='${UrlContainer.baseUrl}${UrlContainer.getProfileEndPoint}';
    ResponseModel response= await apiClient.request(url, Method.getMethod, null,passHeader: true);
    return response;
  }

  Future<ResponseModel>submitInvestment(Map<String,dynamic>params)async{
    String url = '${UrlContainer.baseUrl}${UrlContainer.investStoreUrl}';
    ResponseModel model = await apiClient.request(url, Method.postMethod, params,passHeader: true);
    return model;
  }
}
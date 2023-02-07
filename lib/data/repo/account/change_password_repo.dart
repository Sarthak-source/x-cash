import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class ChangePasswordRepo{

 ApiClient apiClient;

 ChangePasswordRepo({required this.apiClient});
 String token = '', tokenType = '';

 Future<bool> changePassword(String currentPass, String password) async{
  final params = modelToMap(currentPass,password);
  String url = '${UrlContainer.baseUrl}${UrlContainer.changePasswordEndPoint}';

  ResponseModel responseModel= await apiClient.request(url, Method.postMethod, params,passHeader: true);
  if(responseModel.statusCode==200){
   AuthorizationResponseModel model=AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));
   if(model.message?.success!=null && model.message!.success!.isNotEmpty){

    CustomSnackBar.success(successList: model.message?.success??[MyStrings.passwordChanged.tr]);

    return true;

   }else{

    CustomSnackBar.error(errorList: model.message?.error??[MyStrings.requestFail.tr]);
    return false;

   }
  }else{
   //handle error
   return false;
  }
 }

 modelToMap(String currentPassword,String newPass) {

  Map<String,dynamic>map2={
   'current_password':currentPassword,
   'password':newPass,
   'password_confirmation':newPass
  };
  return map2;
 }

}
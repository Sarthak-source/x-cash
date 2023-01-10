import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/profile/profile_response_model.dart';
import 'package:xcash_app/data/model/user_post_model/user_post_model.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class ProfileRepo {
  ApiClient apiClient;

  ProfileRepo({required this.apiClient});

  Future<bool> updateProfile(UserPostModel m,bool isProfile) async {

    try{
      apiClient.initToken();

      String url = '${UrlContainer.baseUrl}${isProfile?UrlContainer.updateProfileEndPoint:UrlContainer.profileCompleteEndPoint}';


      var request=http.MultipartRequest('POST',Uri.parse(url));
       Map<String,String>finalMap={
        'firstname': m.firstname,
        'lastname': m.lastName,
        'address': m.address??'',
        'zip': m.zip??'',
        'state': m.state??"",
        'city': m.city??'',
      };

      request.headers.addAll(<String,String>{'Authorization' : 'Bearer ${apiClient.token}'});
      if(m.image!=null){
        request.files.add( http.MultipartFile('image', m.image!.readAsBytes().asStream(), m.image!.lengthSync(), filename: m.image!.path.split('/').last));
      }
      request.fields.addAll(finalMap);

      http.StreamedResponse response = await request.send();

      String jsonResponse=await response.stream.bytesToString();
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(jsonResponse));



      if(model.status?.toLowerCase()==MyStrings.success.toLowerCase()){
        CustomSnackBar.showCustomSnackBar(errorList: [], msg: model.message?.success??[MyStrings.success], isError: false);
        return true;
      }else{
        CustomSnackBar.showCustomSnackBar(errorList: model.message?.error??[MyStrings.requestFail.tr], msg: [], isError: false);
        return false;
      }

    }catch(e){
      return false;
    }

  }

  Future<ProfileResponseModel> loadProfileInfo() async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.getProfileEndPoint}';

    ResponseModel responseModel =
    await apiClient.request(url, Method.getMethod, null, passHeader: true);

    if (responseModel.statusCode == 200) {
      ProfileResponseModel model =
      ProfileResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if (model.status == 'success') {
        return model;
      } else {
        return ProfileResponseModel();
      }
    } else {
      return ProfileResponseModel();
    }
  }

}
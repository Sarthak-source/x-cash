import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

import '../../../core/utils/method.dart';
import '../../../core/utils/url_container.dart';

class OtpRepo {
  ApiClient apiClient;

  OtpRepo({required this.apiClient});

  Future<ResponseModel> verify(String code, String actionId) async {
    final map = {
      'code': code,
      'action_id': actionId,
    };

    String url = '${UrlContainer.baseUrl}${UrlContainer.otpVerify}';
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, map, passHeader: true);
    return responseModel;

  }

  Future<ResponseModel> resendVerifyCode(String actionId) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.otpResend}';
    ResponseModel response = await apiClient.request(url, Method.postMethod, null, passHeader: true);
    return response;
  }
}
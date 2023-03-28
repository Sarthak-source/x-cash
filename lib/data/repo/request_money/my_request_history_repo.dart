import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class MyRequestHistoryRepo{

  ApiClient apiClient;
  MyRequestHistoryRepo({required this.apiClient});

  Future<ResponseModel> getHistoryData(int page,{bool isMyRequest = false}) async{
    String url = "${UrlContainer.baseUrl}${isMyRequest ? UrlContainer.myRequestHistoryEndPoint : UrlContainer.requestToMeEndPoint}?page=$page";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> otpData() async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.requestToMeEndPoint}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> requestAccept({required String requestId, required String otpType}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.requestAcceptUrl}";
    Map<String, String> params = {"request_id" : requestId, "otp_type" : otpType};
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> requestReject({required String requestId}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.requestRejectUrl}";
    Map<String, String> params = {"request_id" : requestId};
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
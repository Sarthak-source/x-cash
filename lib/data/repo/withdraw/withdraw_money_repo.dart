import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class WithdrawMoneyRepo{

  ApiClient apiClient;
  WithdrawMoneyRepo({required this.apiClient});

  Future<ResponseModel> getData(int page) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.withdrawMoneyUrl}?page=$page";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> submitWithdrawMoney({required String methodId, required String userMethodId, required String amount}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.submitWithdrawMoneyUrl}";
    Map<String, String> params = {
      "method_id" : methodId,
      "user_method_id" : userMethodId,
      "amount" : amount
    };
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getPreviewData({required String trx}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.withdrawPreviewUrl}/$trx";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> submitData({required String otpType, required String trx}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.withdrawMoneySubmitUrl}";
    Map<String, String> params = {
      "otp_type" : otpType,
      "trx" : trx
    };
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
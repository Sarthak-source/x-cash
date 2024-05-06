import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class TransferMoneyRepo{

  ApiClient apiClient;
  TransferMoneyRepo({required this.apiClient});

  Future<ResponseModel> getWalletsData() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.transferMoneyEndPoint}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }

  Future<ResponseModel> submitTransferMoney({
    required String walletId,
    required String amount,
    required String username,
    required String otpType}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.transferMoneySubmitEndPoint}";
    Map<String, String> params = {
      "wallet_id" : walletId,
      "amount" : amount,
      "user" : username,
      "otp_type" : otpType
    };

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> checkUser({required String user}) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.checkUserUrl}";
    Map<String, String> params = {"user": user};
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
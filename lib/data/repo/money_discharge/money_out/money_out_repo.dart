import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class MoneyOutRepo{

  ApiClient apiClient;
  MoneyOutRepo({required this.apiClient});

  Future<dynamic> getMoneyOutWallet() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.moneyOutUrl}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }

  Future<ResponseModel> submitMoneyOut({
    required String walletId,
    required String amount,
    required String agent,
    required String otpType
  }) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.submitMoneyOutUrl}";

    Map<String, String> params = {
      "wallet_id" : walletId,
      "amount" : amount,
      "agent" : agent,
      "otp_type" : otpType
    };

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> checkAgent({required String agent}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.checkAgentUrl}";
    Map<String, String> params = {"agent" : agent};

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
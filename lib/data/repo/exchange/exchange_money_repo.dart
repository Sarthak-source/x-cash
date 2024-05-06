import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class ExchangeMoneyRepo{

  ApiClient apiClient;
  ExchangeMoneyRepo({required this.apiClient});

  Future<ResponseModel> getExchangeData() async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.exchangeMoneyEndPoint}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }

  Future<ResponseModel> confirmExchangeMoney({required String amount, required String fromWalletId, required String toWalletId}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.confirmExchangeMoneyEndPoint}";
    Map<String, String> map = {
      "amount" : amount,
      "from_wallet_id" : fromWalletId.toString(),
      "to_wallet_id" : toWalletId.toString()
    };

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, map, passHeader: true);

    return responseModel;
  }
}
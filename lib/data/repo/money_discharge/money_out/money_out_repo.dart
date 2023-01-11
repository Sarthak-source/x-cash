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
}
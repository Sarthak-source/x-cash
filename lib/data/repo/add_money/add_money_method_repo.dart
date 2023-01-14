import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class AddMoneyMethodRepo{

  ApiClient apiClient;
  AddMoneyMethodRepo({required this.apiClient});

  Future<ResponseModel> getAddMoneyMethodData() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.addMoneyMethodEndPoint}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }

  Future<ResponseModel> insertMoney({required String amount, required String methodCode, required String walletId}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.addMoneyInsertEndPoint}";
    Map<String, String> map = {
      "amount" : amount,
      "method_code" : methodCode,
      "wallet_id" : walletId
    };

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, map, passHeader: true);
    return responseModel;
  }
}
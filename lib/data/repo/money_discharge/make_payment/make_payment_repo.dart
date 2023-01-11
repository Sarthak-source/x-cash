import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class MakePaymentRepo{

  ApiClient apiClient;
  MakePaymentRepo({required this.apiClient});

  Future<dynamic> getMakePaymentWallet() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.makePaymentUrl}";
    print(url);
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }
}
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class RedeemLogRepo{

  ApiClient apiClient;
  RedeemLogRepo({required this.apiClient});

  Future<ResponseModel> getRedeemLogData(int page) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.redeemLogEndPoint}?page=$page";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
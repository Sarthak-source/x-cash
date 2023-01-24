import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class MyRequestHistoryRepo{

  ApiClient apiClient;
  MyRequestHistoryRepo({required this.apiClient});

  Future<ResponseModel> getHistoryData(int page,{bool isMyRequest = false}) async{
    String url = "${UrlContainer.baseUrl}${isMyRequest?UrlContainer.myRequestHistoryEndPoint:UrlContainer.requestToMeEndPoint}?page=$page";
    print(url);
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
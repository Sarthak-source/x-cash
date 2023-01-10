import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class HomeRepo {

  ApiClient apiClient;
  HomeRepo({required this.apiClient});
  String token = '', tokenType = '';

  Future<ResponseModel> getDashboardData() async{
    String url = '${UrlContainer.baseUrl}${UrlContainer.dashBoardUrl}';
    ResponseModel response = await apiClient.request(url,Method.getMethod, null,passHeader: true);
    return response;
  }

  Future<dynamic>getInvestmentData(String type,int page)async{
    String url='${UrlContainer.baseUrl}${UrlContainer.investUrl}?type=$type&take=10';
    final response=await apiClient.request(url,Method.getMethod,null,passHeader: true);
    return response;
  }


}

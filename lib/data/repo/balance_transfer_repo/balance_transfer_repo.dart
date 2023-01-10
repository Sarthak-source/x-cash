import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class BalanceTransferRepo{

  ApiClient apiClient;
  BalanceTransferRepo({required this.apiClient});


  Future<ResponseModel> transferBalance(String username,String amount,String wallet,String code) async{
    late Map<String, String> map;
    if(code.isNotEmpty){
      map = {'username': username, 'amount': amount,'wallet':wallet,'authenticator_code':code};
    } else{
      map = {'username': username, 'amount': amount,'wallet':wallet};
    }

    String url = '${UrlContainer.baseUrl}${UrlContainer.balanceTransfer}';
    ResponseModel model=await apiClient.request(url, Method.postMethod, map,passHeader: true);
    return model;
  }


}
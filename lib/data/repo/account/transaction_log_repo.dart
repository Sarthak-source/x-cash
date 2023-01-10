import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class TransactionRepo{

  ApiClient apiClient;
  TransactionRepo({required this.apiClient});

  Future<ResponseModel> getTransactionList(int page, {String type = "", String remark = "", String searchText = "",String walletType = ''}) async{

    if(type.toLowerCase() == "all" || (type.toLowerCase()!='plus'&&type.toLowerCase()!='minus')){
      type='';
    }

    if(remark.isEmpty || remark.toLowerCase() == "all"){
      remark = '';
    }

    if(walletType.isEmpty || walletType.toLowerCase() == "all"){
      walletType = '';
    }

    String url = '${UrlContainer.baseUrl}${UrlContainer.transactionEndpoint}?page=$page&type=$type&remark=$remark&wallet_type=$walletType&search=$searchText';

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }
}
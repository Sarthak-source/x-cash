import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class TransactionRepo{

  ApiClient apiClient;
  TransactionRepo({required this.apiClient});

  Future<ResponseModel> getTransactionData(int page, {
    String searchText = "",
    String transactionType = "",
    String operationType = "",
    String historyFrom = "",
    String walletCurrency = ""
  }) async{

    if(transactionType.isEmpty || transactionType.toLowerCase() == "all type"){
      transactionType = "";
    } else{
     transactionType = transactionType=='plus'?'plus_trx':transactionType=='minus'?'minus_trx':'';
     print('formated trx type: $transactionType');
    }

    if(operationType.isEmpty || operationType.toLowerCase() == "all operations"){
      operationType = "";
    }

    if(historyFrom.isEmpty || historyFrom.toLowerCase() == "all time"){
      historyFrom = "";
    }

    if(walletCurrency.isEmpty || walletCurrency.toLowerCase() == "all currency"){
      walletCurrency = "";
    }

    String url = "${UrlContainer.baseUrl}${UrlContainer.transactionEndpoint}?page=$page&type=$transactionType&operation=$operationType&time=$historyFrom&currency=$walletCurrency&search=$searchText";

    print(url);
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
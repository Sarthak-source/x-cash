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

    if(transactionType.toLowerCase() == "all type" || (transactionType.toLowerCase() != 'plus_trx' && transactionType.toLowerCase() != "minus_trx")){
      transactionType = "";
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

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
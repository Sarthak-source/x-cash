import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/invoice_items_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class UpdateInvoiceRepo{

  ApiClient apiClient;
  UpdateInvoiceRepo({required this.apiClient});

  Future<ResponseModel> getData({required String invoiceNum}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceEditUrl}/$invoiceNum";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> updateInvoice({
    required String invoiceId,
    required String invoiceTo,
    required String email,
    required String address,
    required String currencyId,
    required String invoiceItemName,
    required String invoiceAmount,
    required List<InvoiceItemsModel> invoiceItemList
  }) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceUpdateUrl}";

    Map<String, String> params = {
      "invoice_id" : invoiceId,
      "invoice_to" : invoiceTo,
      "email" : email,
      "address" : address,
      "currency_id" : currencyId,
    };

    int i = 0;
    for(var invoice in invoiceItemList){
      String itemName = invoice.itemNameController.text;
      String amount = invoice.amountController.text;

      if(itemName.isNotEmpty && amount.isNotEmpty){
        i = i + 1;
        params["item_name[$i]"] = itemName;
        params["amount[$i]"] = amount;
      }
    }

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> sendToEmail(String invoiceId) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceSendEmailUrl}$invoiceId";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> publishInvoice(String invoiceId) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoicePublishUrl}$invoiceId";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> discardInvoice(String invoiceId) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceDiscardUrl}$invoiceId";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
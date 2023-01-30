import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/invoice/invoice_items_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class CreateInvoiceRepo{

  ApiClient apiClient;
  CreateInvoiceRepo({required this.apiClient});

  Future<ResponseModel> getData() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceCreateUrl}";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel>createInvoice(
      String invoiceTo,
      String email,
      String address,
      String curId,
      String firstInvoice,String firstInvoiceAmount,
      List<InvoiceItemsModel> invoiceItemList) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.invoiceCreateUrl}";

    Map<String, String> params = {
      "invoice_to" : invoiceTo,
      "email" : email,
      "address" : address,
      "currency_id" : curId,
      "item_name[0]" : firstInvoice,
      "amount[0]" : firstInvoiceAmount
    };

    int i = 0;
    for (var invoice in invoiceItemList) {
      String invoiceItemName = invoice.itemNameController.text;
      String invoiceAmount = invoice.amountController.text;

      if(invoiceItemName.isNotEmpty && invoiceAmount.isNotEmpty){
        i = i+1;
        params['item_name[$i]'] = invoiceItemName;
        params['amount[$i]'] = invoiceAmount;
      }
    }


    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class VoucherListRepo{

  ApiClient apiClient;
  VoucherListRepo({required this.apiClient});

  Future<ResponseModel> getVoucherListData(int page) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.voucherListEndPoint}?page=$page";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
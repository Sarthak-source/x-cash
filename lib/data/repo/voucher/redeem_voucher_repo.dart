import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class RedeemVoucherRepo{

  ApiClient apiClient;
  RedeemVoucherRepo({required this.apiClient});

  Future<ResponseModel> submitRedeemVoucher({required String voucherCode}) async{
    String url = "${UrlContainer.baseUrl}${UrlContainer.voucherRedeemEndPoint}";
    final params = {"code": voucherCode};
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
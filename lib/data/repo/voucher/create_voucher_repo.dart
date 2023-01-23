import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class CreateVoucherRepo{

  ApiClient apiClient;
  CreateVoucherRepo({required this.apiClient});

  Future<ResponseModel> getCreateVoucherData() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.createVoucherEndPoint}";

    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> submitCreateVoucher({required String amount, required String walletId, required String otpType}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.submitCreateVoucherEndPoint}";

    Map<String, String> params = {
      "wallet_id" : walletId,
      "amount" : amount,
      "otp_type" : otpType
    };

    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }
}
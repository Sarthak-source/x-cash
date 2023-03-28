import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/services/api_service.dart';

class MakePaymentRepo{

  ApiClient apiClient;
  MakePaymentRepo({required this.apiClient});

  Future<dynamic> getMakePaymentWallet() async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.makePaymentUrl}";
    ResponseModel responseModel = await apiClient.request(url, Method.getMethod, null, passHeader: true);

    return responseModel;
  }


  Future<ResponseModel> submitPayment({
    required String walletId,
    required String amount,
    required String merchant,
    required String otpType
  }) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.makePaymentVerifyOtpUrl}";


    Map<String, String> params = {
      "wallet_id" : walletId,
      "amount" : amount,
      "merchant" : merchant,
      "otp_type" : otpType
    };


    ResponseModel responseModel = await apiClient.request(url, Method.postMethod,params,passHeader: true);

    return responseModel;

  }

  Future<ResponseModel> checkMerchant({required String merchant}) async{

    String url = "${UrlContainer.baseUrl}${UrlContainer.checkMerchantUrl}";

    Map<String, String> params = {"merchant" : merchant};
    ResponseModel responseModel = await apiClient.request(url, Method.postMethod, params, passHeader: true);

    return responseModel;
  }
}
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
}
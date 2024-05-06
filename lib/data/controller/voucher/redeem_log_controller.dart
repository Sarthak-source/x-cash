import 'dart:convert';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/voucher/redeem_log_response_model.dart';
import 'package:xcash_app/data/repo/voucher/redeem_log_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class RedeemLogController extends GetxController{

  RedeemLogRepo redeemLogRepo;
  RedeemLogController({required this.redeemLogRepo});

  bool isLoading = true;

  String? nextPageUrl;
  int page = 0;

  RedeemLogResponseModel model = RedeemLogResponseModel();
  List<Data> redeemLogList = [];

  void initialData() async{
    page = 0;
    redeemLogList.clear();
    isLoading = true;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{

    page = page + 1;

    if(page == 1){
      redeemLogList.clear();
    }

    ResponseModel responseModel = await redeemLogRepo.getRedeemLogData(page);
    if(responseModel.statusCode == 200){
      model = RedeemLogResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempRedeemLogList = model.data?.logs?.data;
        if(tempRedeemLogList != null && tempRedeemLogList.isNotEmpty){
          redeemLogList.addAll(tempRedeemLogList);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }

  bool hasNext(){
    return nextPageUrl !=null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }
}
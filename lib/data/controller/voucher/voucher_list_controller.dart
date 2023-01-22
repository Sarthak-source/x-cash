import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/voucher/voucher_list_response_model.dart';
import 'package:xcash_app/data/repo/voucher/voucher_list_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class VoucherListController extends GetxController{

  VoucherListRepo voucherListRepo;
  VoucherListController({required this.voucherListRepo});

  bool isLoading = true;
  VoucherListResponseModel model = VoucherListResponseModel();

  List<Data> voucherList = [];
  String? nextPageUrl;
  int page = 0;
  String currency = "";
  String notUsed = "Not Used";

  void initialState() async{
    page = 0;
    voucherList.clear();
    isLoading = true;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{
    page = page + 1;

    if(page == 1){
      voucherList.clear();
    }

    ResponseModel responseModel = await voucherListRepo.getVoucherListData(page);

    if(responseModel.statusCode == 200){
      model = VoucherListResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.vouchers?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempVoucherList = model.data?.vouchers?.data;
        if(tempVoucherList != null && tempVoucherList.isNotEmpty){
          voucherList.addAll(tempVoucherList);
        }
      }
      else{
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    }
    else{
      CustomSnackBar.error(errorList: [responseModel.message]);
    }
  }

  bool hasNext(){
    return nextPageUrl !=null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }

  bool activeTab = true;
  void changeTabSection(){
    activeTab = !activeTab;
    update();
  }
}
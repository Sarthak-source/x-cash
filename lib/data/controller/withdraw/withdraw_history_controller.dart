import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/withdraw/withdraw_history_response_model.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_history_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class WithdrawHistoryController extends GetxController{

  WithdrawHistoryRepo withdrawHistoryRepo;
  WithdrawHistoryController({required this.withdrawHistoryRepo});

  bool isLoading = true;
  WithdrawHistoryResponseModel model = WithdrawHistoryResponseModel();

  List<Data> withdrawList = [];

  int page = 0;
  String? nextPageUrl;
  TextEditingController searchController = TextEditingController();

  void initialData() async{
    page = 0;
    searchController.text = "";
    withdrawList.clear();
    isLoading = true;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{
    page = page + 1;

    if(page == 1){
      withdrawList.clear();
    }

    String searchText = searchController.text;
    ResponseModel responseModel = await withdrawHistoryRepo.getData(page, searchText: searchText);
    if(responseModel.statusCode == 200){
      model = WithdrawHistoryResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.withdraws?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempWithdrawList = model.data?.withdraws?.data;
        if(tempWithdrawList != null && tempWithdrawList.isNotEmpty){
          withdrawList.addAll(tempWithdrawList);
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

  bool filterLoading = false;
  Future<void> filterData()async{
    page=0;
    filterLoading = true;
    update();

    await loadData();
    filterLoading=false;
    update();
  }

  bool isSearch = false;
  void changeSearchStatus(){
    isSearch = ! isSearch;
    update();

    if(!isSearch){
      initialData();
    }
  }

  bool hasNext(){
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }
}
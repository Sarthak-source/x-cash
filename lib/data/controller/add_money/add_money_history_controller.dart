import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/add_money/add_money_history_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/repo/add_money/add_money_history_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class AddMoneyHistoryController extends GetxController{

  AddMoneyHistoryRepo addMoneyHistoryRepo;
  AddMoneyHistoryController({required this.addMoneyHistoryRepo});

  bool isLoading = true;

  AddMoneyHistoryResponseModel addMoneyHistoryModel = AddMoneyHistoryResponseModel();
  String currency = "";

  List<DepositsData> depositList = [];
  String? nextPageUrl='';
  String trx='';

  int page = 1;

  TextEditingController searchController = TextEditingController();

  void loadPaginationData() async{
    await loadAddMoneyHistory();
    update();
  }

  void initialSelectedValue() async{
    currency = addMoneyHistoryRepo.apiClient.getCurrencyOrUsername();
    page = 0;
    searchController.text = '';
    depositList.clear();
    isLoading = true;
    update();
    await loadAddMoneyHistory();
    isLoading = false;
    update();
  }

  Future<void> loadAddMoneyHistory() async{

    page = page + 1;
    if(page == 1){
      depositList.clear();
    }
    String searchText = searchController.text;
    ResponseModel responseModel = await addMoneyHistoryRepo.getAddMoneyHistoryData(page, searchText: searchText);
    if(responseModel.statusCode == 200){
      AddMoneyHistoryResponseModel model = AddMoneyHistoryResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl = model.data?.deposits?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<DepositsData>? tempDepositList = model.data?.deposits?.data;
        if(tempDepositList != null && tempDepositList.isNotEmpty){
          depositList.addAll(tempDepositList);
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
  Future<void> filterData() async{

    page = 0;
    filterLoading = true;
    update();
    await loadAddMoneyHistory();

    filterLoading = false;
    update();
  }

  bool hasNext(){
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }

  bool isSearch = false;
  void changeSearchStatus(){
    isSearch = ! isSearch;
    update();

    if(!isSearch){
      initialSelectedValue();
    }
  }

  dynamic getStatusOrColor(int index,{bool isStatus = true}){
    String status = depositList[index].status??'';

    if(isStatus){
      String text = status == "1" ? MyStrings.succeed.tr
          : status == "2" ? MyStrings.pending.tr
          : status == "3" ? MyStrings.rejected.tr
          : "";
      return text;
    } else{
      Color color = status == "1" ? MyColor.colorGreen
          : status == "2" ? MyColor.colorOrange
          : status == "3" ? MyColor.colorRed : MyColor.colorGreen;
      return color;
    }
  }
}
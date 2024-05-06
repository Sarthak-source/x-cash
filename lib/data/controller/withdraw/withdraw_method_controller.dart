import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/withdraw/withdraw_method_response_model.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_method_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class WithdrawMethodController extends GetxController{

  WithdrawMethodRepo withdrawMethodRepo;
  WithdrawMethodController({required this.withdrawMethodRepo});

  bool isLoading = true;
  WithdrawMethodResponseModel model = WithdrawMethodResponseModel();
  late Data? addMethod;

  List<Data> methodList = [];

  int page = 0;
  String? nextPageUrl;

  setAddMethod(Data? data) async{
    addMethod = data;
    update();
  }

  void initialData() async{
    page = 0;
    methodList.clear();
    isLoading = true;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{
    page = page + 1;

    if(page == 1){
      methodList.clear();
    }

    addMethod = Data(id: -1, name: MyStrings.addNewMethod);
    methodList.insert(0, addMethod!);
    setAddMethod(addMethod);

    ResponseModel responseModel = await withdrawMethodRepo.getMethodData(page);
    if(responseModel.statusCode == 200){
      model = WithdrawMethodResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      nextPageUrl =  model.data?.methods?.nextPageUrl;

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<Data>? tempMethodList = model.data?.methods?.data;
        if(tempMethodList != null && tempMethodList.isNotEmpty){
          methodList.addAll(tempMethodList);
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
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }

  dynamic getStatusOrColor(int index,{bool isStatus = true}){
    String status = methodList[index].status??'';

    if(isStatus){
      String text = status == "0" ? MyStrings.disabled
          : status == "1" ? MyStrings.enabled : "";
      return text;
    } else{
      Color color = status == "0" ? MyColor.colorOrange
          : status == "1" ? MyColor.colorGreen : MyColor.colorGreen;
      return color;
    }
  }
}
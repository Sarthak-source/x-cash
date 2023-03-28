import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/withdraw/add_withdraw_method_response_model.dart';
import 'package:xcash_app/data/repo/withdraw/add_withdraw_method_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class AddWithdrawMethodController extends GetxController {

  AddWithdrawMethodRepo addWithdrawMethodRepo;
  AddWithdrawMethodController({required this.addWithdrawMethodRepo});

  bool isLoading = true;
  late WithdrawMethod? selectedMethod;
  List<CurrencyModel> selectedCurrencyList = [];
  List<CurrencyModel> allCurrencyList = [];
  List<FormModel> formList = [];
  List<WithdrawMethod> methodList = [];

  setSelectedMethod(WithdrawMethod? withdrawMethod) async{
    selectedMethod = withdrawMethod;
    loadCurrency(selectedMethod);
    await loadForm(withdrawMethod);
    update();
  }

  void loadCurrency(WithdrawMethod? method){

    List<String>?temCurModel = method?.currencies;
    selectedCurrencyList.clear();
    selectedCurrencyList.insert(0, CurrencyModel(curName: MyStrings.selectOne, curId: '-1'));
    selectedCurrencyModel = selectedCurrencyList[0];

    if(temCurModel!=null && temCurModel.isNotEmpty){
      for (var methodCur in temCurModel) {
        for (var element in allCurrencyList) {
          if(methodCur.toString()==element.curId){
            selectedCurrencyList.add(element);
          }
        }
      }
    }
    return;
  }

  setSelectedCurrency(CurrencyModel currencyModel) {
    selectedCurrencyModel = currencyModel;
    update();
  }

  Future<void> loadData() async {
    isLoading = true;
    update();

    methodList.clear();

    selectedMethod = WithdrawMethod(id: -1, name: MyStrings.selectOne);
    methodList.insert(0, selectedMethod!);
    setSelectedMethod(methodList[0]);

    ResponseModel responseModel = await addWithdrawMethodRepo.getData();
    if (responseModel.statusCode == 200) {
      AddWithdrawMethodResponseModel model = AddWithdrawMethodResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if (model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()) {
        List<WithdrawMethod>? tempMethodList = model.data?.withdrawMethod;
        if (tempMethodList != null && tempMethodList.isNotEmpty) {
          methodList.addAll(tempMethodList);
        }
        List<CurrencyModel>?tempCurList = model.data?.currencies;
        if(tempCurList!=null && tempCurList.isNotEmpty){
          allCurrencyList.addAll(tempCurList);
        }
      } else {
        CustomSnackBar.error(
            errorList: model.message?.error ?? [MyStrings.somethingWentWrong]);
      }
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }


    isLoading = false;
    update();
  }

  Future<void> loadForm(WithdrawMethod? model) async {

    formList.clear();
    List<FormModel>? tempFormList = model?.form?.list;

    if (tempFormList != null && tempFormList.isNotEmpty) {
      for (var element in tempFormList) {
        if (element.type == 'select') {
          bool? isEmpty = element.options?.isEmpty;
          bool empty = isEmpty ?? true;
          if (element.options != null && empty != true) {
            element.options?.insert(0, MyStrings.selectOne);
            element.selectedValue = element.options![0];
            var seen = <String>{};
            List<String>?tempOptionList = element.options?.where((element) => seen.add(element)).toList();
            element.options?.clear();
            if(tempOptionList!=null){
              element.options?.addAll(tempOptionList);
            }
            formList.add(element);
          }
        } else {
          formList.add(element);
        }
      }
    }
    return Future.value();

  }

  bool submitLoading=false;
  TextEditingController nameController = TextEditingController();
  CurrencyModel selectedCurrencyModel = CurrencyModel(curName: MyStrings.selectOne, curId: '-1');

  submitData() async {

    List<String> list = hasError();

    if (list.isNotEmpty) {
      CustomSnackBar.error(errorList: list);
      return;
    }

    String methodId   = selectedMethod?.id.toString()??'';
    String currencyId = selectedCurrencyModel.curId;
    String name       = nameController.text;
    
    if(name.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.nickNameEmptyMsg]);
      return;
    }

    submitLoading=true;
    update();

    AuthorizationResponseModel response =await addWithdrawMethodRepo.submitData(name,methodId,currencyId,formList);

    if(response.status?.toLowerCase()==MyStrings.success.toLowerCase()){
      Get.offAndToNamed(RouteHelper.withdrawMethodScreen);
      CustomSnackBar.success(successList: response.message?.success??[MyStrings.success.tr]);
    }else{
      CustomSnackBar.error(errorList: response.message?.error??[MyStrings.requestFail.tr]);
    }

    submitLoading=false;
    update();

  }

  List<String> hasError() {
    List<String> errorList = [];
    errorList.clear();
    for (var element in formList) {
      if (element.isRequired == 'required') {
        if(element.type=='checkbox'){
          if (element.cbSelected == null ) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        }else if(element.type=='file'){
          if (element.imageFile==null) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        }else{
          if (element.selectedValue == '' || element.selectedValue == MyStrings.selectOne) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        }

      }
    }
    return errorList;
  }


  void changeSelectedValue(value, int index) {
    formList[index].selectedValue = value;
    update();
  }

  void changeSelectedRadioBtnValue(int listIndex, int selectedIndex) {
    formList[listIndex].selectedValue =
    formList[listIndex].options?[selectedIndex];
    update();
  }

  void changeSelectedCheckBoxValue(int listIndex, String value) {

    List<String>list=value.split('_');
    int index=int.parse(list[0]);
    bool status=list[1]=='true'?true:false;
    List<String>?selectedValue=formList[listIndex].cbSelected;
    if(selectedValue!=null){
      String? value=formList[listIndex].options?[index];
      if(status){
        if(!selectedValue.contains(value)){
          selectedValue.add(value!);
          formList[listIndex].cbSelected=selectedValue;
          update();
        }
      }else{
        if(selectedValue.contains(value)){
          selectedValue.removeWhere((element) => element==value);
          formList[listIndex].cbSelected=selectedValue;
          update();
        }
      }
    }else{
      selectedValue=[];
      String? value=formList[listIndex].options?[index];
      if(status){
        if(!selectedValue.contains(value)){
          selectedValue.add(value!);
          formList[listIndex].cbSelected=selectedValue;
          update();
        }
      }else{
        if(selectedValue.contains(value)){
          selectedValue.removeWhere((element) => element==value);
          formList[listIndex].cbSelected=selectedValue;
          update();
        }
      }
    }

  }

  void pickFile(int index) async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'doc', 'docx']);

    if (result == null) return;

    formList[index].imageFile = File(result.files.single.path!);
    String fileName = result.files.single.name;
    formList[index].selectedValue = fileName;
    update();
    return;
  }


}

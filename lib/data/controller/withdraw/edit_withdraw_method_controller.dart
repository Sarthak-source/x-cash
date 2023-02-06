import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/withdraw/edit_withdraw_method_response_model.dart';
import 'package:xcash_app/data/repo/withdraw/edit_withdraw_method_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class EditWithdrawMethodController extends GetxController {

  EditWithdrawMethodRepo repo;
  EditWithdrawMethodController({required this.repo});

  EditWithdrawMethodResponseModel model = EditWithdrawMethodResponseModel();

  bool isLoading = true;
  List<FormModel> formList = [];

  String status = '';
  String methodId = '';

  bool isSwitched = false;
  void changeStatus(){
    if(isSwitched == false){
      status = "0";
      update();
    }
    else{
      status = "1";
      update();
    }
    print(status);
  }



  Future<void> loadData(String methodId,String status) async {
    this.status = status;
    this.methodId = methodId;
    isLoading = true;
    formList.clear();
    update();

    ResponseModel responseModel = await repo.getData(methodId);
    if (responseModel.statusCode == 200) {
      model = EditWithdrawMethodResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      status = model.data?.withdrawMethod?.status ?? "";
      if (model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()) {
        loadForm(model);
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

  List<UserData>previousDataList = [];
  Future<void> loadForm(EditWithdrawMethodResponseModel? model) async {
    String name = model?.data?.withdrawMethod?.name??'';
    nameController.text = name;

    previousDataList.clear();
    List<UserData>?tempPreviousList = model?.data?.withdrawMethod?.userData;
    if(tempPreviousList !=null && tempPreviousList.isNotEmpty){
      previousDataList.addAll(tempPreviousList);
    }

    formList.clear();
    List<FormModel>? tempFormList = model?.data?.withdrawMethod?.withdrawMethod?.form?.list;

    if (tempFormList != null && tempFormList.isNotEmpty) {
      for (var element in tempFormList) {
        if (element.type == 'select') {
          bool? isEmpty = element.options?.isEmpty;
          if (element.options != null && isEmpty != true) {
            String selectedValue = await loadPreviousValue(element.name??'', element.type??'');
            if(selectedValue.isNotEmpty){
              var seen = <String>{};
              List<String>?tempOptionList = element.options?.where((element) => seen.add(element)).toList();
              element.options?.clear();
              if(tempOptionList!=null){
                element.options?.addAll(tempOptionList);
              }
              element.selectedValue = selectedValue;
            } else{
              element.options?.insert(0, MyStrings.selectOne);
              element.selectedValue = element.options![0];
              var seen = <String>{};
              List<String>?tempOptionList = element.options?.where((element) => seen.add(element)).toList();
              element.options?.clear();
              if(tempOptionList!=null){
                element.options?.addAll(tempOptionList);
              }
            }
            formList.add(element);
          }
        } else if(element.type=='checkbox'){
          dynamic value = await loadPreviousValue(element.name??'',element.type??'');
          if(value!=null && value.toString().isNotEmpty){
            List<String>tempList = [];
            for(var element in value){
              tempList.add(element.toString());
            }
            formList.add(FormModel(element.name??'', element.label??'', element.isRequired,'', element.options, element.type, '',cbSelected: tempList,imageFile: null));
          } else{
            formList.add(element);
          }
        }
        else {
          dynamic value = await loadPreviousValue(element.name??'',element.type??'');
          if(value!=null && value.toString().isNotEmpty){
            formList.add(FormModel(element.name??'', element.label??'', element.isRequired,'', element.options, element.type, value,cbSelected: [],imageFile: null));
          } else{
            formList.add(element);
          }
        }
      }
    }
    return Future.value();

  }

  Future<dynamic>loadPreviousValue(String name,String type)async{
    dynamic selectedValue;
    for (var element in previousDataList) {
      if(element.name?.toLowerCase()==name.toLowerCase()){
        if(type == 'checkbox'){
          if(element.value!=null && element.value.toString().isNotEmpty){
            if(element.value.runtimeType.toString() == 'List<dynamic>'){
              selectedValue = element.value;
            }
          } else{
            selectedValue = [];
          }
        } else{
          selectedValue = element.value??'';
        }
      }
    }
    return selectedValue;
  }



  bool submitLoading=false;
  TextEditingController nameController = TextEditingController();

  submitData() async {

    List<String> errorList = hasError();

    if (errorList.isNotEmpty) {
      CustomSnackBar.showCustomSnackBar(errorList: errorList, msg: [], isError: true);
      return;
    }

    String name = nameController.text;
    
    if(name.isEmpty){
      CustomSnackBar.error(errorList: [MyStrings.nickNameEmptyMsg]);
      return;
    }

    submitLoading=true;
    update();

    String  id = '';
    String  status = '';

    AuthorizationResponseModel response =await repo.submitData(id,'',name,status,formList);

    if(response.status?.toLowerCase()==MyStrings.success.toLowerCase()){
      CustomSnackBar.showCustomSnackBar(errorList: [], msg: response.message?.success??[MyStrings.success.tr], isError: false);
    }else{
      CustomSnackBar.showCustomSnackBar(errorList: response.message?.error??[MyStrings.requestFail.tr], msg: [], isError: true);
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

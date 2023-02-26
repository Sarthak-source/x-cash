import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/general_setting/general_setting_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/repo/auth/general_setting_repo.dart';
import 'package:xcash_app/data/repo/menu_repo/menu_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class AppMenuController extends GetxController{

  MenuRepo menuRepo;
  GeneralSettingRepo repo;
  AppMenuController({required this.menuRepo, required this.repo});

  bool logoutLoading = false;
  bool isLoading = true;
  bool noInternet = false;

  bool balTransferEnable = true;
  bool langSwitchEnable = true;

  void loadData()async{
    isLoading = true;
    update();
    await configureMenuItem();
    isLoading = false;
    update();
  }

  Future<void>logout()async{
    logoutLoading = true;
    update();

    await menuRepo.logout();
    CustomSnackBar.success(successList: [MyStrings.logoutSuccessMsg]);

    logoutLoading = false;
    update();
    Get.offAllNamed(RouteHelper.loginScreen);
  }

  configureMenuItem() async{

    ResponseModel response = await repo.getGeneralSetting();

    if(response.statusCode==200){
      GeneralSettingResponseModel model = GeneralSettingResponseModel.fromJson(jsonDecode(response.responseJson));
      if (model.status?.toLowerCase()==MyStrings.success.toLowerCase()) {
        // bool langStatus = model.data?.generalSetting?.langSwitch == '0'?false:true;
        // bool bTransferStatus  = model.data?.generalSetting?.bTransfer== '0'?false:true;
        // langSwitchEnable = langStatus;
        // balTransferEnable = bTransferStatus;
        repo.apiClient.storeGeneralSetting(model);
        update();
      }
      else {
        List<String>message=[MyStrings.somethingWentWrong];
        CustomSnackBar.error(errorList:model.message?.error??message);
        return;
      }
    }else{
      if(response.statusCode==503){
        //noInternet=true;
        update();
      }
      CustomSnackBar.error(errorList:[response.message]);
      return;
    }
  }
}
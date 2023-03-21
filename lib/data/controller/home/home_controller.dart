import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/general_setting/general_setting_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/home/home_response_model.dart';
import 'package:xcash_app/data/repo/home/home_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class HomeController extends GetxController{

  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool isLoading = true;

  String username = "";
  String userBalance = "";
  String email = "";
  String totalMoneyIn = "";
  String totalMoneyOut = "";
  String defaultCurrency = "";
  String defaultCurrencySymbol = "";
  String siteName = "";
  String imagePath = "";

  HomeResponseModel model = HomeResponseModel();
  GeneralSettingResponseModel generalSettingResponseModel = GeneralSettingResponseModel();
  List<Wallets> walletList = [];
  List<LatestTrx> trxList = [];

  Future<void> initialData() async{
    walletList.clear();
    trxList.clear();
    isLoading = true;
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{
    defaultCurrency = homeRepo.apiClient.getCurrencyOrUsername();
    defaultCurrencySymbol = homeRepo.apiClient.getCurrencyOrUsername(isSymbol: true);
    generalSettingResponseModel = homeRepo.apiClient.getGSData();
    siteName = generalSettingResponseModel.data?.generalSetting?.siteName ?? "";

    ResponseModel responseModel = await homeRepo.getData();
    if(responseModel.statusCode == 200){
      model = HomeResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        username = model.data?.user?.username ?? "";
        userBalance = model.data?.totalSiteBalance ?? "";
        email = model.data?.user?.email ?? "";
        totalMoneyIn = "${Converter.formatNumber(model.data?.last7DayMoneyInOut?.totalMoneyIn ?? "")} $defaultCurrency";
        totalMoneyOut = "${Converter.formatNumber(model.data?.last7DayMoneyInOut?.totalMoneyOut ?? "")} $defaultCurrency";
        imagePath = model.data?.user?.image??'';

        List<Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
        }

        List<LatestTrx>? tempTrxList = model.data?.latestTrx;
        if(tempTrxList != null && tempTrxList.isNotEmpty){
          trxList.addAll(tempTrxList);
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

  bool isAnimated = false;
  bool isBalanceShown = false;
  bool isBalance = true;

  void changeState() async {
    isAnimated = true;
    isBalance = false;

    await Future.delayed(const Duration(milliseconds: 800), (){
      isBalanceShown = true;
      update();
    }
    );
    await Future.delayed(const Duration(seconds: 3), (){
        isBalanceShown = false;
        update();
      }
    );
    await Future.delayed(const Duration(milliseconds: 200), (){
      isAnimated = false;
      update();
    });
    await Future.delayed(const Duration(milliseconds: 800), (){
       isBalance = true;
       update();
    });
  }

  int index = 0;
  void changeIndex(){
    for(int i = 0; i < walletList.length; i++){
      index = i + 1;
    }
    update();
  }

  bool isVisibleItem = false;
  void visibleItem() {
    isVisibleItem = !isVisibleItem;
    update();
  }
}
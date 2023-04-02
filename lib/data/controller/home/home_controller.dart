import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/shared_preference_helper.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/general_setting/general_setting_response_model.dart';
import 'package:xcash_app/data/model/general_setting/module_settings_response_model.dart' as module;
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/home/home_response_model.dart';
import 'package:xcash_app/data/repo/home/home_repo.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';

import '../../../view/components/image/custom_svg_picture.dart';

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
  List<Widget>moduleList = [];
  List<Widget>historyModuleList = [];

  Future<void> initialData({bool shouldLoad = true}) async{
    moduleList = getModuleList();
    historyModuleList = getHistoryModuleList();
    walletList.clear();
    trxList.clear();
    isLoading = shouldLoad?true:false;
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

        walletList.clear();
        List<Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
        }

        trxList.clear();
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

    await homeRepo.refreshGeneralSetting();
    await homeRepo.refreshModuleSetting();

    moduleList = getModuleList();
    historyModuleList = getHistoryModuleList();
    update();
  }


  

  bool isVisibleItem = false;
  void visibleItem() {
    isVisibleItem = !isVisibleItem;
    update();
  }

  List<Widget>getModuleList(){

    List<Widget>temModuleList = [];

    String pre= homeRepo.apiClient.sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    module.ModuleSettingsResponseModel model= module.ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    List<module.User>?userModule = model.data?.moduleSetting?.user;

    var addMoneyModule           = userModule?.where((element) => element.slug == 'add_money').first;
    bool isAddMoneyEnable        = addMoneyModule!=null && addMoneyModule.status == '0'?false:true;

    var moneyOutModule           = userModule?.where((element) => element.slug == 'money_out').first;
    bool isMoneyOutEnable        = moneyOutModule!=null && moneyOutModule.status == '0'?false:true;

    var makePaymentModule        = userModule?.where((element) => element.slug == 'make_payment').first;
    bool isMakePaymentEnable     = makePaymentModule!=null && makePaymentModule.status=='0'?false:true;

    var moneyExchangeModule      = userModule?.where((element) => element.slug == 'money_exchange').first;
    bool isMoneyExchangeEnable   = moneyExchangeModule!=null && moneyExchangeModule.status=='0'?false:true;

    var transferMoneyModule      = userModule?.where((element) => element.slug == 'transfer_money').first;
    bool isTransferMoneyEnable   = transferMoneyModule!=null && transferMoneyModule.status=='0'?false:true;

    var requestMoneyModule       = userModule?.where((element) => element.slug == 'request_money').first;
    bool isRequestMoneyEnable    = requestMoneyModule!=null && requestMoneyModule.status=='0'?false:true;

    var createVoucherModule      = userModule?.where((element) => element.slug == 'create_voucher').first;
    bool isCreateVoucherEnable   = createVoucherModule!=null && createVoucherModule.status=='0'?false:true;

    var withdrawMoneyModule      = userModule?.where((element) => element.slug == 'withdraw_money').first;
    bool isWithdrawMoneyEnable   = withdrawMoneyModule!=null && withdrawMoneyModule.status=='0'?false:true;


    if(isAddMoneyEnable){
      temModuleList.add( CircleAnimatedButtonWithText(
          buttonName: MyStrings.addMoney,
          backgroundColor: MyColor.screenBgColor,
          child: const CustomSvgPicture(image:MyImages.addMoney,
              color:MyColor.primaryColor,
              height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.addMoneyScreen)
      ));
    }

    if(isMoneyOutEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.moneyOut,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.outMoney, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.moneyOutScreen)
      ));
    }

    if(isMakePaymentEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.makePayment,
          backgroundColor: MyColor.screenBgColor,
          child: const CustomSvgPicture(image:MyImages.makePayment, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.makePaymentScreen)
      ));
    }

    if(isMoneyExchangeEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.exchange,
          height: 40, width: 40,
          backgroundColor: MyColor.screenBgColor,
          child: const CustomSvgPicture(image:MyImages.exchange, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.exchangeMoneyScreen)
      ));
    }

    if(isTransferMoneyEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.transfer,
          backgroundColor: MyColor.screenBgColor,
          child: const CustomSvgPicture(image:MyImages.transfer, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.transferMoneyScreen)
      ));
    }

    if(isRequestMoneyEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.requestMoney,
          backgroundColor: MyColor.screenBgColor,
          child: const CustomSvgPicture(image:MyImages.requestMoney, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.requestMoneyScreen)
      ));
    }

    if(isCreateVoucherEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.createVoucher,
        backgroundColor: MyColor.screenBgColor,
        child: const CustomSvgPicture(image:MyImages.createVoucher, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => gotoNextRoute(RouteHelper.createVoucherScreen),
      ));
    }

    if(isWithdrawMoneyEnable){
      temModuleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.withdrawMoney,
        backgroundColor: MyColor.screenBgColor,
        child: Image.asset(MyImages.withdrawMoney, height: 20, width: 20, color: MyColor.primaryColor),
        onTap: () => gotoNextRoute(RouteHelper.withdrawMoneyScreen),
      ));
    }

    return temModuleList;
  }

  List<Widget>getHistoryModuleList(){

    List<Widget>moduleList = [];

    String pre= homeRepo.apiClient.sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    module.ModuleSettingsResponseModel model= module.ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    List<module.User>?userModule = model.data?.moduleSetting?.user;

    var addMoneyModule           = userModule?.where((element) => element.slug == 'add_money').first;
    bool isAddMoneyEnable        = addMoneyModule!=null && addMoneyModule.status == '0'?false:true;

    var createVoucherModule      = userModule?.where((element) => element.slug == 'create_voucher').first;
    bool isCreateVoucherEnable   = createVoucherModule!=null && createVoucherModule.status=='0'?false:true;

    var requestMoneyModule       = userModule?.where((element) => element.slug == 'request_money').first;
    bool isRequestMoneyEnable    = requestMoneyModule!=null && requestMoneyModule.status=='0'?false:true;


    var withdrawMoneyModule      = userModule?.where((element) => element.slug == 'withdraw_money').first;
    bool isWithdrawMoneyEnable   = withdrawMoneyModule!=null && withdrawMoneyModule.status=='0'?false:true;

    var invoiceModule            = userModule?.where((element) => element.slug == 'create_invoice').first;
    bool isInvoiceEnable         = invoiceModule!=null && invoiceModule.status=='0'?false:true;


    if(isAddMoneyEnable){
      moduleList.add( CircleAnimatedButtonWithText(
          buttonName: MyStrings.addMoneyHistory,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.addMoneyHistory, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: ()=> gotoNextRoute(RouteHelper.addMoneyHistoryScreen)
      ));
    }

    if(isCreateVoucherEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.voucher,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.voucher, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.myVoucherScreen)
      ));
    }

    if(isRequestMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.myRequests,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.myRequest, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.requestToMeScreen)
      ));
    }

    moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.transactions,
        //height: 40, width: 40,
        backgroundColor: MyColor.screenBgColor,
        child: const CustomSvgPicture(image:MyImages.viewTransaction, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: ()=> gotoNextRoute(RouteHelper.transactionHistoryScreen)
    ));


    if(isWithdrawMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.withdrawHistory,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.withdrawHistory, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: ()=> gotoNextRoute(RouteHelper.withdrawHistoryScreen)
      ));
    }

    if(isInvoiceEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.invoice,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.invoice, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => gotoNextRoute(RouteHelper.invoiceScreen)
      ));
    }

    if(isCreateVoucherEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.redeemVoucher,
        backgroundColor: MyColor.screenBgColor,
        child: Image.asset(MyImages.redeemVoucher, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: (){
          Get.back();
          CustomBottomSheet(
              child: const RedeemVoucher()
          ).customBottomSheet(Get.context!);
        },
      ));
    }

    return moduleList;
  }

  void gotoNextRoute(String routeName){
    Get.toNamed(routeName)?.then((value){
      loadData();
    });
  }
}
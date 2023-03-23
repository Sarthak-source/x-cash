import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcash_app/core/helper/shared_preference_helper.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/method.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/authorization/authorization_response_model.dart';
import 'package:xcash_app/data/model/general_setting/general_setting_response_model.dart';
import 'package:xcash_app/data/model/general_setting/module_settings_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:xcash_app/view/components/buttons/circle_animated_button_with_text.dart';
import 'package:xcash_app/view/screens/voucher/redeem_voucher/redeem_voucher.dart';


class ApiClient extends GetxService{

  SharedPreferences sharedPreferences;
  ApiClient({required this.sharedPreferences});

  Future<ResponseModel> request(
      String uri,
      String method,
      Map<String, dynamic>? params,
      {bool passHeader=false,
        bool isOnlyAcceptType=false,}) async {

    Uri url=Uri.parse(uri);
    http.Response response;


    try {
      if (method == Method.postMethod) {

        if(passHeader){

          initToken();
          if(isOnlyAcceptType){
            response = await http.post(url, body: params,headers: {
              "Accept": "application/json",
            });
          }
          else{
            response = await http.post(url, body: params,headers: {
              "Accept": "application/json",
              "Authorization": "$tokenType $token"
            });

          }

        }

        else{
          response = await http.post(url, body: params);
        }

      }
       else if (method == Method.postMethod) {

        if(passHeader){

          initToken();
          response = await http.post(
              url,
              body: params,
              headers: {
            "Accept": "application/json",
            "Authorization": "$tokenType $token"
          });

        }
        else{
          response = await http.post(
              url,
              body: params
          );
        }
      }
      else if (method == Method.deleteMethod) {

        response = await http.delete(url);

      } else if (method == Method.updateMethod) {

        response = await http.patch(url);

      } else {

        if(passHeader){
          initToken();
          response = await http.get(
              url,headers: {
            "Accept": "application/json",
            "Authorization": "$tokenType $token"
          });

        }else{
          response = await http.get(
            url,
          );
        }
      }


      print('url--------------${uri.toString()}');
      print('params-----------${params.toString()}');
      print('status-----------${response.statusCode}');
      print('body-------------${response.body.toString()}');


      if (response.statusCode == 200) {
        try{
          AuthorizationResponseModel model=AuthorizationResponseModel.fromJson(jsonDecode(response.body));
          if( model.remark == 'profile_incomplete' ){
            Get.toNamed(RouteHelper.profileCompleteScreen);
          }else if( model.remark == 'kyc_verification' ){
            Get.offAndToNamed(RouteHelper.kycScreen);
          }else if( model.remark == 'unauthenticated' ){
            sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
            sharedPreferences.remove(SharedPreferenceHelper.token);
            Get.offAllNamed(RouteHelper.loginScreen);
          }
        }catch(e){
          e.toString();
        }

        return ResponseModel(true, 'Success', 200, response.body);
      }
      else if (response.statusCode == 401) {
        sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
        Get.offAllNamed(RouteHelper.loginScreen);
        return ResponseModel(false, MyStrings.unAuthorized.tr, 401, response.body);
      } else if (response.statusCode == 500) {
        return ResponseModel(false, MyStrings.serverError.tr, 500, response.body);
      } else {
        return ResponseModel(false, MyStrings.somethingWentWrong.tr, 499, response.body);
      }
    } on SocketException {
      return ResponseModel(false, MyStrings.noInternet.tr, 503, '');
    } on FormatException {
      return ResponseModel(false, MyStrings.badResponseMsg.tr, 400, '');
    } catch (e) {
      return ResponseModel(false, MyStrings.somethingWentWrong.tr, 499, '');
    }
  }

  String token='';
  String tokenType='';

  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
      String? t =
      sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      String? tType =
      sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
      token = t ?? '';
      tokenType = tType ?? 'Bearer';
    } else {
      token = '';
      tokenType = 'Bearer';
    }
  }

  storeGeneralSetting(GeneralSettingResponseModel model){
    String json=jsonEncode(model.toJson());
    sharedPreferences.setString(SharedPreferenceHelper.generalSettingKey, json);
    getGSData();
  }

  GeneralSettingResponseModel getGSData(){
    String pre= sharedPreferences.getString(SharedPreferenceHelper.generalSettingKey)??'';
    GeneralSettingResponseModel model=GeneralSettingResponseModel.fromJson(jsonDecode(pre));
    return model;
  }

  String getCurrencyOrUsername({bool isCurrency = true,bool isSymbol = false}){

    if(isCurrency){

      String pre= sharedPreferences.getString(SharedPreferenceHelper.generalSettingKey)??'';
      GeneralSettingResponseModel model=GeneralSettingResponseModel.fromJson(jsonDecode(pre));
      String currency = isSymbol?model.data?.generalSetting?.curSym??'':model.data?.generalSetting?.curText??'';
      return currency;

    } else{

      String username = sharedPreferences.getString(SharedPreferenceHelper.userNameKey)??'';
      return username;

    }

  }

  bool getPasswordStrengthStatus(){
      String pre= sharedPreferences.getString(SharedPreferenceHelper.generalSettingKey)??'';
      GeneralSettingResponseModel model=GeneralSettingResponseModel.fromJson(jsonDecode(pre));
      bool checkPasswordStrength = model.data?.generalSetting?.securePassword.toString() == '0' ? false : true;
      return checkPasswordStrength;
  }

  String getTemplateName (){
      String pre= sharedPreferences.getString(SharedPreferenceHelper.generalSettingKey)??'';
      GeneralSettingResponseModel model=GeneralSettingResponseModel.fromJson(jsonDecode(pre));
      String templateName = model.data?.generalSetting?.activeTemplate??'';
      return templateName;
  }

  storeModuleSetting(ModuleSettingsResponseModel model){
    String json=jsonEncode(model.toJson());
    sharedPreferences.setString(SharedPreferenceHelper.moduleSettingKey, json);
    getModuleSettingsData();
  }

  ModuleSettingsResponseModel getModuleSettingsData(){
    String pre= sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    ModuleSettingsResponseModel model=ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    return model;
  }


  List<Widget>getModuleList(){

    List<Widget>moduleList = [];

    String pre= sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    ModuleSettingsResponseModel model= ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    List<User>?userModule = model.data?.moduleSetting?.user;

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
      moduleList.add( CircleAnimatedButtonWithText(
        buttonName: MyStrings.addMoney,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.addMoney, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.addMoneyScreen)
      ));
    }

    if(isMoneyOutEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.moneyOut,
        backgroundColor: MyColor.screenBgColor,
        child: Image.asset(MyImages.outMoney, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.moneyOutScreen)
      ));
    }

    if(isMakePaymentEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.makePayment,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.makePayment, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.makePaymentScreen)
      ));
    }

    if(isMoneyExchangeEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.exchange,
        height: 40, width: 40,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.exchange, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.exchangeMoneyScreen)
      ));
    }

    if(isTransferMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.transfer,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.transfer, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.transferMoneyScreen)
      ));
    }

    if(isRequestMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.requestMoney,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.requestMoney, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.requestMoneyScreen)
      ));
    }

    if(isCreateVoucherEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.createVoucher,
        backgroundColor: MyColor.screenBgColor,
        child: SvgPicture.asset(MyImages.createVoucher, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: () => Get.toNamed(RouteHelper.createVoucherScreen),
      ));
    }

    if(isWithdrawMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.withdrawMoney,
        backgroundColor: MyColor.screenBgColor,
        child: Image.asset(MyImages.withdrawMoney, height: 20, width: 20, color: MyColor.primaryColor),
        onTap: () => Get.toNamed(RouteHelper.withdrawMoneyScreen),
      ));
    }

    return moduleList;
  }

  List<Widget>getHistoryModuleList(){

    List<Widget>moduleList = [];

    String pre= sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    ModuleSettingsResponseModel model= ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    List<User>?userModule = model.data?.moduleSetting?.user;

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
        onTap: ()=> Get.toNamed(RouteHelper.addMoneyHistoryScreen)
      ));
    }

    if(isCreateVoucherEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.voucher,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.voucher, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => Get.toNamed(RouteHelper.myVoucherScreen)
      ));
    }

    if(isRequestMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.myRequests,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.myRequest, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => Get.toNamed(RouteHelper.requestToMeScreen)
      ));
    }

    moduleList.add(CircleAnimatedButtonWithText(
      buttonName: MyStrings.transactions,
      height: 40, width: 40,
      backgroundColor: MyColor.screenBgColor,
      child: Image.asset(MyImages.viewTransaction, color: MyColor.primaryColor, height: 20, width: 20),
      onTap: ()=> Get.toNamed(RouteHelper.transactionHistoryScreen)
    ));


    if(isWithdrawMoneyEnable){
      moduleList.add(CircleAnimatedButtonWithText(
        buttonName: MyStrings.withdrawHistory,
        backgroundColor: MyColor.screenBgColor,
        child: Image.asset(MyImages.withdrawHistory, color: MyColor.primaryColor, height: 20, width: 20),
        onTap: ()=> Get.toNamed(RouteHelper.withdrawHistoryScreen)
      ));
    }

    if(isInvoiceEnable){
      moduleList.add(CircleAnimatedButtonWithText(
          buttonName: MyStrings.invoice,
          backgroundColor: MyColor.screenBgColor,
          child: Image.asset(MyImages.invoice, color: MyColor.primaryColor, height: 20, width: 20),
          onTap: () => Get.toNamed(RouteHelper.invoiceScreen)
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

  bool getModuleStatus(String key) {

    String pre= sharedPreferences.getString(SharedPreferenceHelper.moduleSettingKey)??'';
    ModuleSettingsResponseModel model= ModuleSettingsResponseModel.fromJson(jsonDecode(pre));
    List<User>?userModule = model.data?.moduleSetting?.user;

    var addMoneyModule           = userModule?.where((element) => element.slug == key).first;
    bool status                  = addMoneyModule!=null && addMoneyModule.status == '0'?false:true;

    return status;
  }


}
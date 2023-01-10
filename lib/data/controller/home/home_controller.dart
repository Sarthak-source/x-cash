import 'dart:convert';
import 'package:get/get.dart';

import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/dashboard/dashboard_response_model.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/my_investment/my_investment_response_model.dart' as investment;
import 'package:xcash_app/data/repo/home_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class HomeController extends GetxController {

  bool dashBoardLoading = true;

  HomeRepo homeRepo;
  int notificationListSize=0;

  HomeController({required this.homeRepo});

  String currency = '';
  String curSymbol = '';

  bool hasNext=false;
  String depositWalletBal  = '';
  String interestWalletBal = '';
  String totalInvest       = '';
  String totalDeposit      = '';
  String totalWithdraw     = '';
  String referralEarnings  = '';
  String withdrawPending   = '';
  String depositPending    = '';

  String username = '';
  String email = '';


  List<investment.Data>activePlanList = [];


  bool isLoading = true;
  Future<void>loadData()async{

    currency = homeRepo.apiClient.getCurrencyOrUsername();
    curSymbol = homeRepo.apiClient.getCurrencyOrUsername(isCurrency:true,isSymbol:true);
    isLoading = true;
    update();

    await loadDashboard();
    await loadActivePlan();

    isLoading = false;
    update();
  }

  Future<void>loadDashboard()async{

    ResponseModel response = await homeRepo.getDashboardData();

    if(response.statusCode == 200){

      HomeResponseModel model = HomeResponseModel.fromJson(jsonDecode(response.responseJson));

      if(model.status == 'success'){

        totalInvest       = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.totalInvest ?? '0')} $currency';
        totalDeposit      = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.totalDeposit ?? '0')} $currency';
        totalWithdraw     = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.totalWithdrawal ?? '0')} $currency';
        referralEarnings  = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.referralEarnings ?? '0')} $currency';
        depositPending    = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.pendingDeposit ?? '0')} $currency';
        withdrawPending   = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.pendingWithdraw ?? '0')} $currency';
        depositWalletBal  = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.user?.depositWallet ?? '0')} $currency';
        interestWalletBal = '${Converter.twoDecimalPlaceFixedWithoutRounding(model.data?.user?.interestWallet ?? '0')} $currency';

        username          = model.data?.user?.username??'';
        email             = model.data?.user?.email??'';

      }else{
        CustomSnackBar.error(errorList: model.message?.error??[MyStrings.somethingWentWrong]);
      }
    } else{
      CustomSnackBar.error(errorList: [response.message]);
    }

  }

  Future<void>loadActivePlan()async{

    ResponseModel response = await homeRepo.getInvestmentData('active', 1);
    activePlanList.clear();


    if(response.statusCode == 200){

      investment.MyInvestmentResponseModel model =  investment.MyInvestmentResponseModel.fromJson(jsonDecode(response.responseJson));

      if(model.status == 'success'){

        List< investment.Data>?tempList = model.data?.invests?.data;
        if(tempList!=null && tempList.isNotEmpty){
          activePlanList.addAll(tempList);
        }

      }else{
        CustomSnackBar.error(errorList: model.message?.error??[MyStrings.somethingWentWrong]);
      }
    } else{
      CustomSnackBar.error(errorList: [response.message]);
    }

  }



  bool isExpand = false;
  void changeVisibility(){
    isExpand = !isExpand;
    update();
  }


  bool renewLoading=false;
  Future<bool> renewPackage() async {
    renewLoading=true;
    update();
    renewLoading=false;
    update();

    return true;
  }

  String getMessage(int index) {
    String period  = activePlanList[index].period =='-1'?MyStrings.lifeTime: '${activePlanList[index].period??''} ${activePlanList[index].timeName}';
    String message = '${Converter.twoDecimalPlaceFixedWithoutRounding(activePlanList[index].interest??'0')} $currency ${MyStrings.every.toLowerCase()} ${activePlanList[index].timeName}\nfor $period ';
    return message;
  }

  double getPercent(int index) {
    double percent = 0;
    try{
      percent = (double.tryParse(activePlanList[index].nextTimePercent??'0')??0)/100;
    }catch(e){
      percent = 0;
    }
    return percent;
  }

}

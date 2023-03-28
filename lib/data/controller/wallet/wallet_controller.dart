import 'dart:convert';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/global/response_model/response_model.dart';
import 'package:xcash_app/data/model/wallet/wallet_response_model.dart' as wallet_model;
import 'package:xcash_app/data/repo/wallet/wallet_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class WalletController extends GetxController{

  WalletRepo walletRepo;
  WalletController({required this.walletRepo});

  bool isLoading = true;
  String image = MyImages.withdrawMoney;
  wallet_model.Wallets? wallets = wallet_model.Wallets();
  List<wallet_model.Wallets> walletList = [];

  Future<void> loadWalletData() async{
    walletList.clear();
    isLoading = true;
    update();

    ResponseModel responseModel = await walletRepo.getWalletData();
    if(responseModel.statusCode == 200){
      wallet_model.WalletResponseModel model = wallet_model.WalletResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      if(model.status.toString().toLowerCase() == MyStrings.success.toLowerCase()){
        List<wallet_model.Wallets>? tempWalletList = model.data?.wallets;
        if(tempWalletList != null && tempWalletList.isNotEmpty){
          walletList.addAll(tempWalletList);
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
}
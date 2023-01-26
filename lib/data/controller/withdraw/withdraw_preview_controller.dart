
import 'package:get/get.dart';
import '../../repo/withdraw/withdraw_money_repo.dart';

class WithdrawPreviewController extends GetxController{

  WithdrawMoneyRepo repo;
  WithdrawPreviewController({required this.repo});


  void loadData(String trxId) async {
    repo.getPreviewData(trx: trxId);
  }

}
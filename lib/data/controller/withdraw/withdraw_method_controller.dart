import 'package:get/get.dart';
import 'package:xcash_app/data/model/withdraw/withdraw_method_response_model.dart';
import 'package:xcash_app/data/repo/withdraw/withdraw_method_repo.dart';

class WithdrawMethodController extends GetxController{

  WithdrawMethodRepo withdrawMethodRepo;
  WithdrawMethodController({required this.withdrawMethodRepo});

  bool isLoading = true;
  WithdrawMethodResponseModel model = WithdrawMethodResponseModel();
  Data? addMethod = Data();

  List<Data> methodList = [];

  int page = 0;
  String? nextPageUrl;

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
  }

  bool hasNext(){
    return nextPageUrl != null && nextPageUrl!.isNotEmpty && nextPageUrl != 'null'? true : false;
  }
}
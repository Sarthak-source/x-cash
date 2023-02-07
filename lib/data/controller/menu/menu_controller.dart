import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/repo/menu_repo/menu_repo.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class MenuController extends GetxController{

  MenuRepo menuRepo;
  MenuController({required this.menuRepo});

  bool logoutLoading = false;

  Future<void>logout()async{
    logoutLoading = true;
    update();

    await menuRepo.logout();
    CustomSnackBar.success(successList: [MyStrings.logoutSuccessMsg]);

    logoutLoading = false;
    update();
    Get.offAllNamed(RouteHelper.loginScreen);
  }
}
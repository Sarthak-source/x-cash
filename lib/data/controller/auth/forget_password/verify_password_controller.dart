import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/model/auth/verification/email_verification_model.dart';
import 'package:xcash_app/data/repo/auth/login_repo.dart';
import 'package:xcash_app/view/components/custom_snackbar.dart';

class VerifyPasswordController extends GetxController{
  LoginRepo loginRepo;


  List<String> errors = [];
  String email='';
  String password='';
  String confirmPassword='';
  bool isLoading = false;
  bool remember = false;
  bool hasError = false;
  String currentText = "";

  VerifyPasswordController({required this.loginRepo});


  bool isResendLoading=false;
  void resendForgetPassCode() async {
    isResendLoading=true;
    update();
    String value = email;
    String type = 'email';
    await loginRepo.forgetPassword(type, value);
    isResendLoading=false;
    update();
  }

  bool verifyLoading=false;

  void verifyForgetPasswordCode(String value) async{
    if(value.isNotEmpty){
      verifyLoading=true;
      update();
      EmailVerificationModel model= await loginRepo.verifyForgetPassCode(value);

      if(model.code==200){
        verifyLoading=false;
        Get.offAndToNamed(RouteHelper.resetPasswordScreen,arguments: [email,value]);
      }else{
        verifyLoading=false;
        update();
        List<String>errorList=[MyStrings.verificationFailed];
        CustomSnackBar.error(errorList: model.message?.error??errorList);
      }
    }
  }


}


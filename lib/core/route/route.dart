import 'package:get/get.dart';
import 'package:xcash_app/view/screens/auth/change_password/change_password_screen.dart';
import 'package:xcash_app/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:xcash_app/view/screens/auth/login/login_screen.dart';
import 'package:xcash_app/view/screens/onboard/onboard_screen.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';

class RouteHelper{

  static const String splashScreen = "/splash-screen";
  static const String onboardScreen = "/onboard-screen";
  static const String loginScreen = "/login-screen";
  static const String forgotPasswordScreen = "/forgot-password-screen";
  static const String changePasswordScreen = "/change-password-screen";

  List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
  ];
}
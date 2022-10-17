import 'package:get/get.dart';
import 'package:xcash_app/view/components/bottom-nav-bar/bottom_nav_bar.dart';
import 'package:xcash_app/view/screens/auth/change_password/change_password_screen.dart';
import 'package:xcash_app/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:xcash_app/view/screens/auth/login/login_screen.dart';
import 'package:xcash_app/view/screens/auth/registration/registration_screen.dart';
import 'package:xcash_app/view/screens/onboard/onboard_screen.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';
import 'package:xcash_app/view/screens/wallet/my_wallet_screen.dart';

class RouteHelper{

  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String loginScreen = "/login_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String changePasswordScreen = "/change_password_screen";
  static const String registrationScreen = "/registration_screen";
  static const String myWalletScreen = "/my_wallet_screen";

  static const String bottomNavBar = "/bottom_nav_bar";

  List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),
    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),
    GetPage(name: myWalletScreen, page: () => const MyWalletScreen())
  ];
}
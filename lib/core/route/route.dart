import 'package:get/get.dart';
import 'package:xcash_app/view/screens/onboard/onboard_screen.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';

class RouteHelper{

  static const String splashScreen = "/splash-screen";
  static const String onboard = "/onboard-screen";

  List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboard, page: () => const OnboardScreen())
  ];
}
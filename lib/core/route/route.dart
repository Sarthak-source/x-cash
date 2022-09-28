import 'package:get/get.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';

class RouteHelper{

  static const String splashScreen = "/splash-screen";

  List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => const SplashScreen())
  ];
}
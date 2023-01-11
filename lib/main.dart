import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'core/di_service/di_services.dart' as di_service;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di_service.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MyStrings.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: RouteHelper.splashScreen,
      navigatorKey: Get.key,
      getPages: RouteHelper().routes,
    );
  }
}

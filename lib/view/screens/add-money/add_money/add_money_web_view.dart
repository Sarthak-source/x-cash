import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/screens/add-money/add_money/widget/webview_widget.dart';

import '../../../components/app-bar/custom_appbar.dart';

class AddMoneyWebView extends StatefulWidget {
  final String redirectUrl;

  const AddMoneyWebView({Key? key,
    required this.redirectUrl}) : super(key: key);


  @override
  State<AddMoneyWebView> createState() => _AddMoneyWebViewState();
}

class _AddMoneyWebViewState extends State<AddMoneyWebView> {


  @override
  void initState() {
    super.initState();
    permissionServices();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.screenBgColor,
        appBar: const CustomAppBar(title: '',isShowBackBtn: true,),
        body: MyWebViewWidget(url: widget.redirectUrl),
        floatingActionButton: favoriteButton(),
    );
  }


  Widget favoriteButton() {
    return FloatingActionButton(
              backgroundColor: MyColor.colorRed,
              onPressed: () async {
                Get.offAndToNamed(RouteHelper.addMoneyHistoryScreen);
              },
              child: const Icon(Icons.cancel,color: MyColor.colorWhite,size: 30,),
            );
  }


  Future<Map<Permission, PermissionStatus>> permissionServices() async{

    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.microphone,
      Permission.mediaLibrary,
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses;
  }

}
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/url_container.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class AddMoneyWebView extends StatefulWidget {

  final String redirectUrl;

  const AddMoneyWebView({Key? key,
    required this.redirectUrl}) : super(key: key);


  @override
  State<AddMoneyWebView> createState() => _AddMoneyWebViewState();
}

class _AddMoneyWebViewState extends State<AddMoneyWebView> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: WebView(
            initialUrl: widget.redirectUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {},
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {

              if(url=='${UrlContainer.domainUrl}/user/deposit/history'){
                Get.offAndToNamed(RouteHelper.addMoneyHistoryScreen);
                CustomSnackBar.success(successList: [MyStrings.requestSuccess]);
              } else if(url=='${UrlContainer.baseUrl}user/deposit'){
                Get.back();
                CustomSnackBar.error(errorList: [MyStrings.requestFail]);
              }
            },
            onPageFinished: (String url) {},
            gestureNavigationEnabled: true,
            backgroundColor: const Color(0x00000000),
          ),
        );
      }),
      floatingActionButton: favoriteButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {});
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: MyColor.colorRed,
              onPressed: () async {
                Get.offAndToNamed(RouteHelper.addMoneyHistoryScreen);
              },
              child: const Icon(Icons.cancel,color: MyColor.colorWhite,size: 30,),
            );
          }
          return Container();
        });
  }
}
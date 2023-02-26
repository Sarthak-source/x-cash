import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/qr_code/qr_code_controller.dart';
import 'package:xcash_app/data/repo/qr_code/qr_code_repo.dart';
import 'package:xcash_app/data/services/api_service.dart';
import 'package:xcash_app/view/components/app-bar/custom_appbar.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(QrCodeRepo(apiClient: Get.find()));
    Get.put(QrCodeController(qrCodeRepo: Get.find()));

    super.initState();
  }

  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });
    qrController.scannedDataStream.listen((scanData) {

        result = scanData;
        String? myQrCode = result?.code!=null && result!.code.toString().isNotEmpty ?result?.code.toString():'';
        print('my qr code ${myQrCode}');

        if(myQrCode!=null && myQrCode.isNotEmpty){
          manageQRData(myQrCode);
        }

    });
  }

  void manageQRData(String myQrCode)async{
    final controller =  Get.find<QrCodeController>();

   qrController?.stopCamera();

    bool result = await controller.submitQrData(myQrCode);



  }

  @override
  void reassemble() {
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  void dispose() {
    qrController?.dispose();
    qrController?.stopCamera();
    super.dispose();
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    if (qrController != null && mounted) {
      qrController!.pauseCamera();
      qrController!.resumeCamera();
    }

    return GetBuilder<QrCodeController>(
      builder: (viewController) => SafeArea(
        child: Scaffold(
          appBar:CustomAppBar(
            title: MyStrings.qrScan.tr,
            isShowBackBtn: true,
            bgColor: MyColor.appBarColor,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  cameraFacing: CameraFacing.back,
                  overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: (MediaQuery.of(context).size.width < 400 ||
                          MediaQuery.of(context).size.height < 400)
                          ? 300.0
                          : 300.0
                  ),
                  onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

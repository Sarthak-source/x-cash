import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';
import '../../../core/utils/my_strings.dart';



class DownloadingDialog extends StatefulWidget {
  final String url;
  final String fileName;
  final bool isPdf;
  const DownloadingDialog({Key? key,required this.url,this.isPdf = true,required this.fileName}) : super(key: key);

  @override
  DownloadingDialogState createState() => DownloadingDialogState();
}

class DownloadingDialogState extends State<DownloadingDialog> {

  int _total = 0, _received = 0;
  late http.StreamedResponse _response;
  File? _image;
  final List<int> _bytes = [];

  Future<void> _downloadImage() async {
    _response = await http.Client()
        .send(http.Request('GET', Uri.parse('https://upload.wikimedia.org/wikipedia/commons/f/ff/Pizigani_1367_Chart_10MB.jpg')));
    _total = _response.contentLength ?? 0;

    _response.stream.listen((value) {
      setState(() {
        _bytes.addAll(value);
        _received += value.length;
      });
    }).onDone(() async {
      final file = File('${(await getApplicationDocumentsDirectory()).path}/qr_code.png');
     File savedFile =  await file.writeAsBytes(_bytes);
      Get.back();
      CustomSnackBar.success(successList: ['${MyStrings.fileDownloadedSuccess}: ${savedFile.path.toString()}']);
      setState(() {
        _image = file;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _downloadImage();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColor.getCardBgColor(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           CircularProgressIndicator(
            value: 40,
            strokeWidth: 4.0,
            valueColor: AlwaysStoppedAnimation(MyColor.primaryColor.withOpacity(0.1)),
            backgroundColor: MyColor.primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${MyStrings.downloading.tr} ${_received ~/ 1024}/${_total ~/ 1024} KB',
            style: regularDefault
          ),
        ],
      ),
    );
  }
}

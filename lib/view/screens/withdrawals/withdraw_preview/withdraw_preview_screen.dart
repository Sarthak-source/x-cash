import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawPreviewScreen extends StatefulWidget {
  const WithdrawPreviewScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawPreviewScreen> createState() => _WithdrawPreviewScreenState();
}

class _WithdrawPreviewScreenState extends State<WithdrawPreviewScreen> {

  @override
  void initState() {

    String trxId = Get.arguments;

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

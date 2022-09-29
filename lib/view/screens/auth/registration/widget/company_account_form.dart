import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class CompanyAccountForm extends StatefulWidget {
  const CompanyAccountForm({Key? key}) : super(key: key);

  @override
  State<CompanyAccountForm> createState() => _CompanyAccountFormState();
}

class _CompanyAccountFormState extends State<CompanyAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: MyColor.primaryColor100,
    );
  }
}

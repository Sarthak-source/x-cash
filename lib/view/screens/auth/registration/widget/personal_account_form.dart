import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class PersonalAccountForm extends StatefulWidget {
  const PersonalAccountForm({Key? key}) : super(key: key);

  @override
  State<PersonalAccountForm> createState() => _PersonalAccountFormState();
}

class _PersonalAccountFormState extends State<PersonalAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: MyColor.primaryColor,
    );
  }
}

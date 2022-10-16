import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: Center(
          child: Text("Activity Screen"),
        ),
      ),
    );
  }
}

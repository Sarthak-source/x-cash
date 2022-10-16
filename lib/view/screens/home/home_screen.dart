import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor,
        body: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}

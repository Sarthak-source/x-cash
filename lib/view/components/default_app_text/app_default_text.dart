import 'package:flutter/material.dart';

class AppDefaultText extends StatelessWidget {
  final Widget child;
  const AppDefaultText({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.00),
      child: child,
    );
  }
}

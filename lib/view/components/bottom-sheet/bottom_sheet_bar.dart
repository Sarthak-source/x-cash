import 'package:flutter/material.dart';

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5, width: 35,
      decoration: BoxDecoration(
        color: const Color(0xff555555).withOpacity(0.13),
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }
}

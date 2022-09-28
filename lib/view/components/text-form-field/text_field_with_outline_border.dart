import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';

class TextFieldWithOutlineBorder extends StatelessWidget {

  final String hintText;
  final bool readOnly;
  final TextEditingController controller;

  const TextFieldWithOutlineBorder({

    Key? key,
    required this.hintText,
    required this.readOnly,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 40, width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(

        color: MyColor.primaryColor100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(

        child: TextFormField(

          style: interRegularSmall,
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(

            border: InputBorder.none,
            hintText: hintText,
            hintStyle: interRegularSmall.copyWith(color: MyColor.primarySubTextColor),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';

class WithdrawStatusBtn extends StatelessWidget {
  final String status;
  const WithdrawStatusBtn({Key? key,required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: status == "1" ? MyColor.colorGreen.withOpacity(0.2)
              : status == "2" ? Colors.orangeAccent.withOpacity(0.2)
              : status == "3" ? Colors.red.withOpacity(0.2) : MyColor.colorGreen.withOpacity(0.2)
      ),
      child: Text(
        status == "1" ? MyStrings.approved
            : status == "2" ? MyStrings.pending
            : status == "3" ? MyStrings.rejected
            : "",
        textAlign: TextAlign.center,
        style: regularDefault.copyWith(
            color: status == "1" ? MyColor.colorGreen
                : status == "2" ? Colors.orangeAccent
                : status == "3" ? Colors.red : MyColor.colorGreen,
            fontSize: Dimensions.fontExtraSmall
        ),
      ),
    );
  }
}

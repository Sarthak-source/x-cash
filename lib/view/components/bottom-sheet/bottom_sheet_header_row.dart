
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class BottomSheetHeaderRow extends StatelessWidget {
  final String header ;
  const BottomSheetHeaderRow({Key? key,this.header = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColor.colorGrey.withOpacity(0.2),
            ),
          ),
        ),
        const SizedBox(height: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Expanded(child: BottomSheetHeaderText(text: header)),
            const BottomSheetCloseButton()
          ],
        ),
        const SizedBox(height: Dimensions.space10,),
      ],
    );
  }
}

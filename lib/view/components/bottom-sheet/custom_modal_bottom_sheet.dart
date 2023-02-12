import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_color.dart';

customModalBottomSheet({required BuildContext context, required Widget child}){

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            maxChildSize: 0.8,
            minChildSize: 0.15,
            //initialChildSize: list.length> 2? 0.6 : 0.3,
            expand: true,
            builder: (context, scrollController) => Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: child
            ),
          );
        }
    );
}
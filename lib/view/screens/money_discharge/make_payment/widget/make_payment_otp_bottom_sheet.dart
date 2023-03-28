import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/helper/string_format_helper.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/money_discharge/make_payment/make_payment_controller.dart';

showMakePaymentOTPBottomSheet(List<String>? list, {required BuildContext context}){

  if (list != null && list.isNotEmpty) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            minChildSize: 0.15,
            initialChildSize: list.length> 2 ? 0.6 : 0.3,
            expand: true,
            builder: (context, scrollController) => Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: MyColor.colorWhite,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 5,
                        width: 50,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColor.colorGrey.withOpacity(0.1),
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimensions.space15),
                    Expanded(
                      child: ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  String selectedValue = list[index];
                                  final controller= Get.find<MakePaymentController>();
                                  controller.setOtpMethod(selectedValue);
                                  Navigator.pop(context);

                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                                      border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                                  ),
                                  child: Text(
                                    list[index].toString().toTitleCase(),
                                    style: regularDefault,
                                  ),
                                ),
                              );
                          }),
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}
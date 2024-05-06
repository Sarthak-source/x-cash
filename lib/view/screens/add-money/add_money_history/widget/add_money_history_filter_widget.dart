import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/data/controller/add_money/add_money_history_controller.dart';

class AddMoneyHistoryFilterWidget extends StatelessWidget {
  const AddMoneyHistoryFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMoneyHistoryController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: Dimensions.space15),
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius),boxShadow: MyUtils.getCardShadow()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.transactionNo.tr, style: regularSmall.copyWith(color: MyColor.getLabelTextColor(), fontWeight: FontWeight.w500)),
                  const SizedBox(height: Dimensions.space5),
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      cursorColor: MyColor.primaryColor,
                      style: regularSmall.copyWith(color: MyColor.colorBlack),
                      keyboardType: TextInputType.text,
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          hintText: MyStrings.searchByTrxId.tr,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          hintStyle: regularSmall.copyWith(color: MyColor.hintTextColor),
                          filled: true,
                          fillColor: MyColor.transparentColor,
                          border: const OutlineInputBorder(borderSide: BorderSide(color: MyColor.colorGrey, width: 0.5)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: MyColor.colorGrey, width: 0.5)),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: MyColor.primaryColor, width: 0.5))
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Dimensions.space10),
            InkWell(
              onTap: () {
                controller.filterData();
              },
              child: Container(
                height: 45,
                width: 45,
                padding:
                const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: MyColor.primaryColor,),
                child: const Icon(
                    Icons.search_outlined,
                    color: MyColor.colorWhite,
                    size: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

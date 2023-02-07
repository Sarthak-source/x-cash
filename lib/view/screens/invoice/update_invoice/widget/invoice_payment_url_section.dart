import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class InvoicePaymentUrlSection extends StatelessWidget {
  const InvoicePaymentUrlSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space12, horizontal: Dimensions.space15),
      decoration: BoxDecoration(color: MyColor.getCardBgColor(), borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyStrings.invoicePaymentUrl,
            style: regularDefault.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: Dimensions.space10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5),
                      borderRadius: BorderRadius.circular(Dimensions.defaultRadius)
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "https://sohan.thesoftking.com/xcash/v4/user/invoice/edit/DUBMOAJDJTJ9",
                      style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.7)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Dimensions.space10),
              GestureDetector(
                onTap: (){
                  Clipboard.setData(const ClipboardData(text: "https://sohan.thesoftking.com/xcash/v4/user/invoice/edit/DUBMOAJDJTJ9")).then((value) => CustomSnackBar.success(
                      successList: ["Copied to Clipboard"]
                  ));
                },
                child: const CircleShapeImage(image: MyImages.copy),
              )
            ],
          ),
        ],
      ),
    );
  }
}

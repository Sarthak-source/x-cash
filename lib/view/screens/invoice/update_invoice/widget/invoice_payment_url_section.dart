import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/invoice/update_invoice_controller.dart';
import 'package:xcash_app/view/components/image/circle_shape_image.dart';
import 'package:xcash_app/view/components/snack_bar/show_custom_snackbar.dart';

class InvoicePaymentUrlSection extends StatelessWidget {
  const InvoicePaymentUrlSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateInvoiceController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space12, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
            color: MyColor.transparentColor,
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
            border: Border.all(color: MyColor.colorGrey.withOpacity(0.2), width: 0.5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MyStrings.invoicePaymentUrl.tr,
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
                        controller.model.data?.invoice?.link ?? "",
                        style: regularDefault.copyWith(color: MyColor.colorBlack.withOpacity(0.7)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.space10),
                GestureDetector(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: controller.model.data?.invoice?.link ?? "")).then((value) => CustomSnackBar.success(
                        successList: [MyStrings.copyLink.tr]
                    ));
                  },
                  child: const CircleShapeImage(image: MyImages.copy),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/buttons/custom_circle_animated_button.dart';
import 'package:xcash_app/view/components/divider/custom_divider.dart';
import 'package:xcash_app/view/components/text-form-field/custom_amount_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text/bottom_sheet_header_text.dart';

class ExchangeMoney extends StatefulWidget {
  const ExchangeMoney({Key? key}) : super(key: key);

  @override
  State<ExchangeMoney> createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<ExchangeMoney> {

  var selectFromCurrency = "USD";
  List<String> fromCurrency = ["USD", "BDT", "ETH", "NGN"];

  var selectToCurrency = "TRX";
  List<String> toCurrency = ["TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR", "GBP", "IDR", "INR", "JPY"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BottomSheetHeaderText(text: MyStrings.exchangeMoney),
            BottomSheetCloseButton()
          ],
        ),

        const CustomDivider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: CustomDropDownTextField(
                  labelText: "From Currency",
                  iconColor: MyColor.colorWhite,
                  fillColor: MyColor.primaryColor,
                  dropDownColor: MyColor.primaryColor,
                  selectedValue: selectFromCurrency,
                  radius: 8,
                  onChanged: (value){
                    setState(() {
                      selectFromCurrency = value.toString();
                    });
                  },
                  items: fromCurrency.map((String val){
                    return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: interRegularSmall.copyWith(color: MyColor.colorWhite),
                        )
                    );
                  }).toList()
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.space20),
              child: CustomCircleAnimatedButton(
                  onTap: (){},
                  height: 40,
                  width: 40,
                  backgroundColor: MyColor.primaryColor100,
                  child: Image.asset(MyImages.exchange2, color: MyColor.colorGrey, height: 20, width: 20),
              ),
            ),

            SizedBox(
              width: 100,
              child: CustomDropDownTextField(
                  radius: 8,
                  selectedValue: selectToCurrency,
                  labelText: "To Currency",
                  onChanged: (value){
                    setState(() {
                      selectToCurrency = value.toString();
                    });
                  },
                  items: toCurrency.map((String val){
                    return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: interRegularSmall,
                        )
                    );
                  }).toList()
              ),
            )
          ],
        ),
        const SizedBox(height: Dimensions.space20),

        CustomAmountTextField(
            labelText: MyStrings.amount,
            hintText: MyStrings.amountHint,
            onChanged: (value){}
        ),

        const SizedBox(height: Dimensions.space20),

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(MyStrings.exchangeCalculation, style: interRegularExtraSmall),
              const SizedBox(height: Dimensions.space10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "58.00", style: interRegularDefaultLarge.copyWith(color: MyColor.primaryColor, fontWeight: FontWeight.w600)),
                    TextSpan(text: " NGN", style: interRegularSmall.copyWith(fontWeight: FontWeight.w500))
                  ]
                )
              )
            ],
          ),
        ),

        const SizedBox(height: Dimensions.space25),

        CustomAnimatedButton(
            onTap: (){},
            height: 45,
            width: MediaQuery.of(context).size.width,
            backgroundColor: MyColor.primaryColor,
            child: Text(MyStrings.exchange, textAlign: TextAlign.center, style: interRegularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';

class FiltersField extends StatefulWidget {
  const FiltersField({Key? key}) : super(key: key);

  @override
  State<FiltersField> createState() => _FiltersFieldState();
}

class _FiltersFieldState extends State<FiltersField> {

  var selectValue1 = "All Type";
  var selectValue2 = "All Operations";
  var selectValue3 = "All Time";
  var selectValue4 = "All Currency";

  List<String> transactionTypes = ["All Type", "Plus Transaction", "Minus Transaction"];
  List<String> operationTypes = ["All Operations", "Add Money", "Exchange Money"];
  List<String> historyTypes = ["All Time", "Last 7 Days", "Last 15 Days"];
  List<String> currencyTypes = ["All Currency", "TRX", "USD", "BCH", "BDT", "BTC", "BTL", "CNY", "ETH", "EUR"];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: MyColor.transparentColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              SizedBox(
                width: 170,
                child: CustomDropDownTextField(
                    labelText: "Transaction Type",
                    selectedValue: selectValue1,
                    onChanged: (value){
                      setState(() {
                        selectValue1 = value.toString();
                      });
                    },
                    items: transactionTypes.map((String val){
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                            style: interRegularSmall,
                          )
                      );
                    }).toList()
                ),
              ),

              const SizedBox(width: Dimensions.space10),

              SizedBox(
                width: 170,
                child: CustomDropDownTextField(
                    labelText: "Operation Type",
                    selectedValue: selectValue2,
                    onChanged: (value){
                      setState(() {
                        selectValue2 = value.toString();
                      });
                    },
                    items: operationTypes.map((String val){
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                            style: interRegularSmall,
                          )
                      );
                    }).toList()
                ),
              ),

              const SizedBox(width: Dimensions.space10),

              SizedBox(
                width: 170,
                child: CustomDropDownTextField(
                    labelText: "History Form",
                    selectedValue: selectValue3,
                    onChanged: (value){
                      setState(() {
                        selectValue3 = value.toString();
                      });
                    },
                    items: historyTypes.map((String val){
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                            style: interRegularSmall,
                          )
                      );
                    }).toList()
                ),
              ),

              const SizedBox(width: Dimensions.space10),

              SizedBox(
                width: 170,
                child: CustomDropDownTextField(
                    labelText: "Wallet Currency",
                    selectedValue: selectValue4,
                    onChanged: (value){
                      setState(() {
                        selectValue4 = value.toString();
                      });
                    },
                    items: currencyTypes.map((String val){
                      return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                            style: interRegularSmall,
                          )
                      );
                    }).toList()
                ),
              ),

              const SizedBox(width: Dimensions.space10),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomAnimatedButton(
                    onTap: (){},
                    height: 45,
                    width: 60,
                    backgroundColor: MyColor.primaryColor,
                    child: Text("Apply", textAlign: TextAlign.center, style: interRegularSmall.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/Sizedbox/form_sized_box.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field_for_phone.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/bottom_section.dart';

class CompanyAccountForm extends StatefulWidget {
  const CompanyAccountForm({Key? key}) : super(key: key);

  @override
  State<CompanyAccountForm> createState() => _CompanyAccountFormState();
}

class _CompanyAccountFormState extends State<CompanyAccountForm> {

  var selectedValue = "Select Country";
  List<String> items = [MyStrings.countryHint, "Bangladesh", "India", "Pakistan"];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            labelText: MyStrings.companyName,
            hintText: MyStrings.companyNameHint,
            onChanged: (value){},
          ),

          const FormSizedBox(),

          CustomTextField(
            labelText: MyStrings.representativeFirstName,
            hintText: MyStrings.firstNameHint,
            onChanged: (value){},
          ),

          const FormSizedBox(),

          CustomTextField(
            labelText: MyStrings.representativeLastName,
            hintText: MyStrings.lastNameHint,
            onChanged: (value){},
          ),

          const FormSizedBox(),

          CustomDropDownTextField(
            labelText: MyStrings.country,
            hintText: MyStrings.countryHint,
            selectedValue: selectedValue,
            onChanged: (value){
              setState(() {
                selectedValue = value.toString();
              });
            },
            items: items.map((String val) {
              return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                    style: regularSmall,
                  )
              );
            }).toList(),
          ),

          const FormSizedBox(),

          CustomTextFieldForPhone(
            inputType: TextInputType.number,
            labelText: MyStrings.mobileNumber,
            hintText: MyStrings.mobileNumberHint,
            onChanged: (value){},
          ),

          const FormSizedBox(),

          CustomTextField(
              labelText: MyStrings.userName,
              hintText: MyStrings.userNameHint,
              onChanged: (value){}
          ),

          const FormSizedBox(),

          CustomTextField(
              labelText: MyStrings.emailAddress,
              hintText: MyStrings.emailAddressHint,
              onChanged: (value){}
          ),

          const FormSizedBox(),

          CustomTextField(
            labelText: MyStrings.password,
            isPassword: true,
            hintText: MyStrings.passwordHint,
            onChanged: (value){},
            isShowSuffixIcon: true,
          ),
          const FormSizedBox(),
          CustomTextField(
            labelText: MyStrings.confirmPassword,
            isPassword: true,
            hintText: MyStrings.confirmPasswordHint,
            onChanged: (value){},
            isShowSuffixIcon: true,
          ),

          const SizedBox(height: Dimensions.space30),

          RoundedButton(
              press: (){
                Get.offAndToNamed(RouteHelper.bottomNavBar);
              },
              text: MyStrings.signUp,
          ),
          const SizedBox(height: Dimensions.space30),
          const BottomSection()
        ],
      ),
    );
  }
}

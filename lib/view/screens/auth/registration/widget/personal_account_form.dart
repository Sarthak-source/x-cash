import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/route/route.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/styles.dart';
import 'package:xcash_app/view/components/Sizedbox/form_sized_box.dart';
import 'package:xcash_app/view/components/buttons/custom_animated_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field_for_phone.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_form_field.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/bottom_section.dart';

class PersonalAccountForm extends StatefulWidget {
  const PersonalAccountForm({Key? key}) : super(key: key);

  @override
  State<PersonalAccountForm> createState() => _PersonalAccountFormState();
}

class _PersonalAccountFormState extends State<PersonalAccountForm> {

  var selectedValue = "Select Country";
  List<String> items = [MyStrings.countryHint, "Bangladesh", "India", "Pakistan"];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            labelText: MyStrings.firstName,
            hintText: MyStrings.firstNameHint,
            onChanged: (value){},
          ),

          const FormSizedBox(),

          CustomTextFormField(
            labelText: MyStrings.lastName,
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
                      style: interRegularSmall,
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

          CustomTextFormField(
              labelText: MyStrings.emailAddress,
              hintText: MyStrings.emailAddressHint,
              onChanged: (value){}
          ),

          const FormSizedBox(),

          CustomTextFormField(
            labelText: MyStrings.password,
            isPassword: true,
            isShowBorder: true,
            hintText: MyStrings.passwordHint,
            onChanged: (value){},
            isShowSuffixIcon: true,
          ),

          const FormSizedBox(),

          CustomTextFormField(
            labelText: MyStrings.confirmPassword,
            isPassword: true,
            isShowBorder: true,
            hintText: MyStrings.confirmPasswordHint,
            onChanged: (value){},
            isShowSuffixIcon: true,
          ),

          const SizedBox(height: Dimensions.space30),

          CustomAnimatedButton(
              onTap: (){
                Get.offAndToNamed(RouteHelper.bottomNavBar);
              },
              height: 45,
              width: MediaQuery.of(context).size.width,
              backgroundColor: MyColor.primaryColor,
              child: Text(
                  MyStrings.signUp,
                  textAlign: TextAlign.center,
                  style: interSemiBoldSmall.copyWith(color: MyColor.colorWhite)
              )
          ),

          const SizedBox(height: Dimensions.space30),

          const BottomSection()
        ],
      ),
    );
  }
}

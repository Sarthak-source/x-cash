import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/account/profile_controller.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';

import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Form(
          child: Column(
            children: [
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.firstName,
                  hintText: MyStrings.enterFirstName,
                  onChanged: (value){},
                  focusNode: controller.firstNameFocusNode,
                  controller: controller.firstNameController
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.lastName,
                  hintText: MyStrings.enterLastName,
                  onChanged: (value){},
                  focusNode: controller.lastNameFocusNode,
                  controller: controller.lastNameController
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.address,
                  hintText: MyStrings.enterAddress,
                  onChanged: (value){},
                  focusNode: controller.addressFocusNode,
                  controller: controller.addressController
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.state,
                  hintText: MyStrings.enterYourState,
                  onChanged: (value){},
                  focusNode: controller.stateFocusNode,
                  controller: controller.stateController
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.zipCode,
                  hintText: MyStrings.enterYourZipCode,
                  onChanged: (value){},
                  focusNode: controller.zipCodeFocusNode,
                  controller: controller.zipCodeController
              ),
              const SizedBox(height: Dimensions.space15),
              CustomTextField(
                  needOutlineBorder: true,
                  labelText: MyStrings.city,
                  hintText: MyStrings.enterYourCity,
                  onChanged: (value){},
                  focusNode: controller.cityFocusNode,
                  controller: controller.cityController,
              ),
              const SizedBox(height: Dimensions.space30),
              controller.isSubmitLoading ? const RoundedLoadingBtn() : RoundedButton(
                press: (){
                  controller.updateProfile();
                },
                text: MyStrings.updateProfile.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}

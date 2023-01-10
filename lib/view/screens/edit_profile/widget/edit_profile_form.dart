import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';

import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                labelText: MyStrings.firstName,
                hintText: "Enter ${MyStrings.firstName}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.lastName,
                hintText: "Enter ${MyStrings.lastName}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.emailAddress,
                hintText: "Enter ${MyStrings.emailAddress}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.address,
                hintText: "Enter ${MyStrings.address}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.state,
                hintText: "Enter ${MyStrings.state}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.zipCode,
                hintText: "Enter ${MyStrings.zipCode}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.city,
                hintText: "Enter ${MyStrings.city}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space15),

            CustomTextField(
                labelText: MyStrings.country,
                hintText: "Enter ${MyStrings.country}",
                onChanged: (value){}
            ),
            const SizedBox(height: Dimensions.space30),
            RoundedButton(
              press: (){},
              text: MyStrings.updateProfile,
            )
          ],
        ),
      ),
    );
  }
}

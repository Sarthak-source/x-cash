import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/data/controller/account/change_password_controller.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';

class ChangePasswordForm extends StatefulWidget {

  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ChangePasswordController>(
        builder: (controller) => Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                animatedLabel: true,
                needOutlineBorder: true,
                labelText: MyStrings.currentPassword.tr,
                onChanged: (value){
                  return ;
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return  MyStrings.enterCurrentPass.tr;
                  } else {
                    return null;
                  }
                },
                controller: controller.currentPassController,
                isShowSuffixIcon: true,
                isPassword: true,
              ),
              const SizedBox(height: Dimensions.space20),
              CustomTextField(
                  animatedLabel: true,
                  needOutlineBorder: true,
                  labelText: MyStrings.newPassword.tr,
                  onChanged: (value){
                    return ;
                  },
                  validator: (value) {
                  if (value.toString().isEmpty) {
                    return  MyStrings.enterNewPass.tr;
                  } else {
                    return null;
                  }
                 },
                  controller: controller.passController,
                  isShowSuffixIcon: true,
                  isPassword: true,
              ),
              const SizedBox(height: Dimensions.space20),
              CustomTextField(
                  animatedLabel: true,
                  needOutlineBorder: true,
                  labelText: MyStrings.confirmPassword.tr,
                  onChanged: (value){
                    return ;
                  },
                  validator: (value) {
                    if (controller.confirmPassController.text != controller.passController.text) {
                      return  MyStrings.kMatchPassError.tr;
                    } else {
                      return null;
                    }
                  },
                  controller: controller.confirmPassController,
                  isShowSuffixIcon: true,
                  isPassword: true,
              ),
              const SizedBox(height: Dimensions.space25),
              controller.submitLoading?
              const RoundedLoadingBtn():
              RoundedButton(
                text: MyStrings.submit.tr,
                press: (){
                  if (formKey.currentState!.validate()) {
                    controller.changePassword();
                  }
                }
              )
            ],
          ),
        )
    );
  }
}

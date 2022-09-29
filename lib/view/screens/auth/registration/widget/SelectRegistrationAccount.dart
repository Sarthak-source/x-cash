import 'package:flutter/material.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/my_images.dart';
import 'package:xcash_app/view/components/text/small_text.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/company_account_form.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/personal_account_form.dart';
import 'package:xcash_app/view/screens/auth/registration/widget/user_type_card.dart';

class SelectRegistrationAccount extends StatefulWidget {
  const SelectRegistrationAccount({Key? key}) : super(key: key);

  @override
  State<SelectRegistrationAccount> createState() => _SelectRegistrationAccountState();
}

class _SelectRegistrationAccountState extends State<SelectRegistrationAccount> {

  int selectedUser = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectUserType(MyImages.user1, MyStrings.personalAccount, 0),

              const SizedBox(width: Dimensions.space15),

              selectUserType(MyImages.suitcase, MyStrings.companyAccount, 1)
            ],
          ),

        const SizedBox(height: Dimensions.space30),

        selectedUser == 0 ? const PersonalAccountForm() : const CompanyAccountForm()
      ],
    );
  }

  selectUserType(String imagePath, String title, int index) {
    
    return Expanded(

      child: TypeofUser(
          onPressed: (){

            setState(() {
              selectedUser = index;
            });
          },
          borderColor: index == selectedUser ? MyColor.primaryColor : MyColor.borderColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Dimensions.space10),
                decoration: const BoxDecoration(
                  color: MyColor.primaryColor100,
                  shape: BoxShape.circle
                ),
                child: Image.asset(
                    imagePath,
                    color: index == selectedUser ? MyColor.primaryColor : MyColor.primarySubTextColor,
                    height: 16,
                    width: 16
                ),
              ),

              const SizedBox(width: Dimensions.space10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: title, textColor: MyColor.primaryTextColor, fontWeight: FontWeight.w500),

                  const SizedBox(height: Dimensions.space5),

                  const SmallText(text: MyStrings.signUp, textColor: MyColor.primarySubTextColor, fontSize: Dimensions.fontExtraSmall),
                ],
              )
            ],
          )
      ),
    );
  }
}

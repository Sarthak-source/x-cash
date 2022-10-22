import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/constants/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/util.dart';
import 'package:xcash_app/view/components/app-bar/custom_app_bar.dart';
import 'package:xcash_app/view/screens/Profile/widget/profile_field_section.dart';
import 'package:xcash_app/view/screens/edit_profile/widget/edit_profile_form.dart';
import 'package:xcash_app/view/screens/edit_profile/widget/edit_profile_top_section.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  void initState() {
    MyUtil.secondaryTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primaryColor100,
        appBar: CustomAppBar(
          elevation: 0,
          backgroundColor: MyColor.primaryColor,
          title: MyStrings.editProfile,
          textColor: MyColor.colorWhite,
          showBackIcon: true,
          iconColor: MyColor.colorWhite,
          changeRoute: () => Get.back(),
        ),
        body: Stack(
          children: [
            Positioned(
              top: -10,
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                color: MyColor.primaryColor,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15, top: Dimensions.space20, bottom: Dimensions.space20),
                child: Column(
                  children: const [
                    EditProfileTopSection(),

                    SizedBox(height: Dimensions.space20),

                    EditProfileForm()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

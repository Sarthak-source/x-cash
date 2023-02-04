import 'package:flutter/material.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/my_color.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/auth/auth/registration_controller.dart';

class CountryBottomSheet{

  static void bottomSheet(BuildContext context, RegistrationController controller){
    showModalBottomSheet(
        isScrollControlled:true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context){
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space15),
            decoration: BoxDecoration(
                color: MyColor.getScreenBgColor(),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColor.colorGrey.withOpacity(0.2),
                    ),

                  ),
                ),
                const SizedBox(height: 15,),
                Flexible(
                  child: ListView.builder(itemCount:controller.countryList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){
                              controller.countryController.text = controller.countryList[index].country??'';
                              controller.setCountryNameAndCode(controller.countryList[index].country??'',
                                  controller.countryList[index].countryCode??'', controller.countryList[index].dialCode??'');

                              Navigator.pop(context);

                              FocusScopeNode currentFocus = FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: MyColor.colorGrey.withOpacity(0.2))
                              ),
                              child: Text(
                                  '+${controller.countryList[index].dialCode}  ${controller.countryList[index].country}',
                                  style: regularDefault.copyWith(color: MyColor.getTextColor())
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }
    );
  }
}
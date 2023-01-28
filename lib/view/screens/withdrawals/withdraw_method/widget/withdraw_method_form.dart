import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcash_app/core/utils/my_strings.dart';
import 'package:xcash_app/core/utils/dimensions.dart';
import 'package:xcash_app/core/utils/style.dart';
import 'package:xcash_app/data/controller/withdraw/withdraw_method_controller.dart';
import 'package:xcash_app/view/components/buttons/rounded_button.dart';
import 'package:xcash_app/view/components/buttons/rounded_loading_button.dart';
import 'package:xcash_app/view/components/checkbox/custom_check_box.dart';
import 'package:xcash_app/view/components/custom_loader/custom_loader.dart';
import 'package:xcash_app/view/components/custom_radio_button.dart';
import 'package:xcash_app/view/components/form_row.dart';

import 'package:xcash_app/view/components/text-form-field/custom_drop_down_text_field.dart';
import 'package:xcash_app/view/components/text-form-field/custom_text_field.dart';
import 'package:xcash_app/view/screens/auth/kyc/widget/widget/choose_file_list_item.dart';

import '../../../../../data/model/withdraw/add_withdraw_method_response_model.dart' as withdraw;

class WithdrawMethodForm extends StatefulWidget {

  const WithdrawMethodForm({Key? key}) : super(key: key);

  @override
  State<WithdrawMethodForm> createState() => _WithdrawMethodFormState();
}

class _WithdrawMethodFormState extends State<WithdrawMethodForm> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawMethodController>(builder: (controller) {
      return SizedBox(
        child: controller.isLoading?const CustomLoader():Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDownTextField(
                labelText: MyStrings.selectMethod,
                selectedValue: controller.selectedMethod,
                onChanged: (value) {
                  controller.setSelectedMethod(value);
                },
                items: controller.methodList.map((withdraw.WithdrawMethod val) {
                  return DropdownMenuItem<withdraw.WithdrawMethod>(
                    value: val,
                    child: Text(
                      val.name ?? '',
                      style: regularSmall,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Dimensions.space15),
              CustomDropDownTextField(
                labelText: MyStrings.selectCurrency,
                selectedValue: controller.selectedCurrencyModel,
                onChanged: (value) {
                  controller.setSelectedCurrency(value);
                },
                items: controller.currencyList.map((withdraw.CurrencyModel val) {
                  return DropdownMenuItem<withdraw.CurrencyModel>(
                    value: val,
                    child: Text(
                      val.curName,
                      style: regularSmall,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: Dimensions.space15),

              CustomTextField(
                  needOutlineBorder: true,
                  controller: controller.nameController,
                  labelText: MyStrings.provideNickName,
                  hintText: MyStrings.provideNickName.toLowerCase(),
                  onChanged: (value) {}
              ),

              Visibility(
                visible: true,
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Dimensions.space15),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.formList.length,
                        itemBuilder: (ctx,index){
                          withdraw.FormModel? model= controller.formList[index] ;
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                model.type=='text'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                        hintText: (model.name??'').toString().capitalizeFirst,
                                        needLabel: true,
                                        needOutlineBorder: true,
                                        labelText: model.name??'',
                                        onChanged: (value){
                                          controller.changeSelectedValue(value, index);
                                        }),
                                    const SizedBox(height: 10,),
                                  ],
                                ):model.type=='textarea'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                        needLabel: true,
                                        needOutlineBorder: true,
                                        labelText: model.name??'',
                                        hintText: (model.name??'').capitalizeFirst,
                                        onChanged: (value){
                                          controller.changeSelectedValue(value, index);
                                        }),
                                    const SizedBox(height: 10,),
                                  ],
                                ):model.type=='select'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormRow(label: model.name??'', isRequired: model.isRequired=='optional'?false:true),
                                    const SizedBox(height: Dimensions.textToTextSpace,),
                                    CustomDropDownTextField(
                                      onChanged: (value){
                                        controller.changeSelectedValue(value,index);
                                      },selectedValue: model.selectedValue, items:model.options?.map((String val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: Text(
                                          val,
                                          style: regularSmall,
                                        ),
                                      );
                                    }).toList(),),
                                  ],
                                ):model.type=='radio'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormRow(label: model.name??'', isRequired: model.isRequired=='optional'?false:true),
                                    CustomRadioButton(title:model.name,selectedIndex:controller.formList[index].options?.indexOf(model.selectedValue??'')??0,list: model.options??[],onChanged: (selectedIndex){
                                      controller.changeSelectedRadioBtnValue(index,selectedIndex);
                                    },),
                                  ],
                                ):model.type=='checkbox'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormRow(label: model.name??'', isRequired: model.isRequired=='optional'?false:true),
                                    CustomCheckBox(selectedValue:controller.formList[index].cbSelected,list: model.options??[],onChanged: (value){
                                      controller.changeSelectedCheckBoxValue(index,value);
                                    },),
                                  ],
                                ):model.type=='file'?Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FormRow(label: model.name??'', isRequired: model.isRequired=='optional'?false:true),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(vertical: Dimensions.textToTextSpace),
                                        child: SizedBox(
                                          child:InkWell(
                                              onTap: (){
                                                controller.pickFile(index);
                                              }, child: ChooseFileItem(fileName: model.selectedValue??MyStrings.chooseFile)),
                                        )
                                    )
                                  ],
                                ):const SizedBox(),
                                const SizedBox(height: 5,),
                              ],
                            ),
                          );
                        }
                    )
                  ],
                ),
              ),

              const SizedBox(height: Dimensions.space25),

              controller.isLoading?const RoundedLoadingBtn():RoundedButton(
                  press: () {
                    controller.submitData();
                  },
                  text: MyStrings.addWithdrawMethod
              ),
            ],
          ),
        ),
      );
    });
  }
}

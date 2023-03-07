import 'dart:io';
import '../auth/sign_up_model/registration_response_model.dart';

class AddWithdrawMethodResponseModel {
  AddWithdrawMethodResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  AddWithdrawMethodResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _remark;
  String? _status;
  Message? _message;
  Data? _data;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = _remark;
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      List<WithdrawMethod>? withdrawMethod, 
      List<CurrencyModel>? currencies,}){
    _withdrawMethod = withdrawMethod;
    _currencies = currencies;
}

  Data.fromJson(dynamic json) {
    if (json['withdraw_method'] != null) {
      _withdrawMethod = [];
      json['withdraw_method'].forEach((v) {
        _withdrawMethod?.add(WithdrawMethod.fromJson(v));
      });
    }

    if (json['currencies'] != null) {
      var map=Map.from(json['currencies']).map((key, value) => MapEntry(key, value));
      _currencies=[];
      try{

        print(map.toString());

        List<CurrencyModel>?list=map.entries.map((e) =>
            CurrencyModel(
              curName:e.key,
                curId:e.value.toString()
            ),).toList();


        print('currency list: ${list.length}');

        if(list.isNotEmpty){
          _currencies?.addAll(list);
          print('inserted curList: ${_currencies?.length}');
        }

      }finally{}
    }
  }
  List<WithdrawMethod>? _withdrawMethod;
  List<CurrencyModel>? _currencies;

  List<WithdrawMethod>? get withdrawMethod => _withdrawMethod;
  List<CurrencyModel>? get currencies => _currencies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdrawMethod != null) {
      map['withdraw_method'] = _withdrawMethod?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrencyModel {

  final String curName;
  final String curId;
  CurrencyModel({required this.curName,required this.curId});



}


class WithdrawMethod {
  WithdrawMethod({
      int? id, 
      String? formId, 
      String? name, 
      String? minLimit, 
      String? maxLimit, 
      String? fixedCharge, 
      String? rate, 
      String? percentCharge, 
      String? currency,
      String? description, 
      String? status, 
      List<String>? userGuards, 
      List<String>? currencies, 
      String? createdAt, 
      String? updatedAt, 
      Form? form,}){
    _id = id;
    _formId = formId;
    _name = name;
    _minLimit = minLimit;
    _maxLimit = maxLimit;
    _fixedCharge = fixedCharge;
    _rate = rate;
    _percentCharge = percentCharge;
    _currency = currency;
    _description = description;
    _status = status;
    _userGuards = userGuards;
    _currencies = currencies;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _form = form;
}

  WithdrawMethod.fromJson(dynamic json) {
    _id = json['id'];
    _formId = json['form_id'].toString();
    _name = json['name'];
    _minLimit = json['min_limit'] != null ? json['min_limit'].toString() : "0";
    _maxLimit = json['max_limit'] != null ? json['max_limit'].toString() : "0";
    _fixedCharge = json['fixed_charge'] != null ? json['fixed_charge'].toString() : "0";
    _rate = json['rate'].toString();
    _percentCharge = json['percent_charge'].toString();
    _currency = json['currency'].toString();
    _description = json['description'];
    _status = json['status'].toString();
    _userGuards = json['user_guards'] != null ? json['user_guards'].cast<String>() : [];
    _currencies = json['currencies'] != null ? json['currencies'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _form = json['form'] != null ? Form.fromJson(json['form']['form_data']) : null;
  }
  int? _id;
  String? _formId;
  String? _name;
  String? _minLimit;
  String? _maxLimit;
  String? _fixedCharge;
  String? _rate;
  String? _percentCharge;
  String? _currency;
  String? _description;
  String? _status;
  List<String>? _userGuards;
  List<String>? _currencies;
  String? _createdAt;
  String? _updatedAt;
  Form? _form;

  int? get id => _id;
  String? get formId => _formId;
  String? get name => _name;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get fixedCharge => _fixedCharge;
  String? get rate => _rate;
  String? get percentCharge => _percentCharge;
  String? get currency => _currency;
  String? get description => _description;
  String? get status => _status;
  List<String>? get userGuards => _userGuards;
  List<String>? get currencies => _currencies;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Form? get form => _form;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['form_id'] = _formId;
    map['name'] = _name;
    map['min_limit'] = _minLimit;
    map['max_limit'] = _maxLimit;
    map['fixed_charge'] = _fixedCharge;
    map['rate'] = _rate;
    map['percent_charge'] = _percentCharge;
    map['currency'] = _currency;
    map['description'] = _description;
    map['status'] = _status;
    map['user_guards'] = _userGuards;
    map['currencies'] = _currencies;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Form {
  Form({List<FormModel>?list}){
    _list=list;
  }

  List<FormModel>? _list=[];
  List<FormModel>? get list => _list;

  Form.fromJson(dynamic json) {
    var map=Map.from(json).map((key, value) => MapEntry(key, value));
    try{

      List<FormModel>?list=map.entries.map((e) =>
          FormModel(
              e.value['name'],
              e.value['label'],
              e.value['is_required'].toString(),
              e.value['extensions'],
              (e.value['options'] as List).map((e) => e as String).toList(),
              e.value['type'].toString(),
              ''
          ),).toList();

      if(list.isNotEmpty){
        list.removeWhere((element) => element.toString().isEmpty);
        _list?.addAll(list);
      }
      _list;

    }finally{

    }
  }


}

class FormModel {
  String? name;
  String? label;
  String? isRequired;
  String? extensions;
  List<String>? options;
  String? type;
  dynamic selectedValue;
  File? imageFile;
  List<String>?cbSelected;

  FormModel(this.name, this.label, this.isRequired, this.extensions, this.options, this.type,this.selectedValue,{this.cbSelected,this.imageFile});

}
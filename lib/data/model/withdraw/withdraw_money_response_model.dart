import '../auth/sign_up_model/registration_response_model.dart';

class WithdrawMoneyResponseModel {
  WithdrawMoneyResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  WithdrawMoneyResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }
  String? _remark;
  String? _status;
  Message? _message;
  MainData? _data;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  MainData? get data => _data;

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

class MainData {
  MainData({
      Methods? methods,}){
    _methods = methods;
}

  MainData.fromJson(dynamic json) {
    _methods = json['methods'] != null ? Methods.fromJson(json['methods']) : null;
  }
  Methods? _methods;

  Methods? get methods => _methods;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_methods != null) {
      map['methods'] = _methods?.toJson();
    }
    return map;
  }

}

class Methods {
  Methods({
      List<Data>? data,
      String? nextPageUrl,
      String? path}){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Methods.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'] != null ? json['next_page_url'].toString() : "";
    _path = json['path'];
  }
  List<Data>? _data;
  String? _nextPageUrl;
  String? _path;

  List<Data>? get data => _data;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? name, 
      String? userId, 
      String? userType, 
      String? methodId, 
      String? currencyId,
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? minLimit,
      String? maxLimit,
    WithdrawMethod? withdrawMethod,
      Currency? currency,}){
    _id = id;
    _name = name;
    _userId = userId;
    _userType = userType;
    _methodId = methodId;
    _currencyId = currencyId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _withdrawMethod = withdrawMethod;
    _currency = currency;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'].toString();
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _methodId = json['method_id'].toString();
    _currencyId = json['currency_id'].toString();
    _status = json['status'].toString();
    _minLimit = json['min_limit']!=null?json['min_limit'].toString():'';
    _maxLimit = json['max_limit']!=null?json['max_limit'].toString():'';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _withdrawMethod = json['withdraw_method'] != null ? WithdrawMethod.fromJson(json['withdraw_method']) : null;
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  String? _name;
  String? _userId;
  String? _userType;
  String? _methodId;
  String? _currencyId;
  String? _status;
  String? _minLimit;
  String? _maxLimit;
  String? _createdAt;
  String? _updatedAt;
  WithdrawMethod? _withdrawMethod;
  Currency? _currency;

  int? get id => _id;
  String? get name => _name;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get methodId => _methodId;
  String? get currencyId => _currencyId;
  String? get status => _status;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  WithdrawMethod? get withdrawMethod => _withdrawMethod;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['method_id'] = _methodId;
    map['currency_id'] = _currencyId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_withdrawMethod != null) {
      map['withdraw_method'] = _withdrawMethod?.toJson();
    }
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    return map;
  }

}

class Currency {
  Currency({
      int? id, 
      String? currencyCode, 
      String? currencySymbol, 
      String? currencyFullName, 
      String? currencyType, 
      String? rate, 
      String? isDefault, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _currencyCode = currencyCode;
    _currencySymbol = currencySymbol;
    _currencyFullName = currencyFullName;
    _currencyType = currencyType;
    _rate = rate;
    _isDefault = isDefault;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _currencyCode = json['currency_code'].toString();
    _currencySymbol = json['currency_symbol'].toString();
    _currencyFullName = json['currency_FullName'].toString();
    _currencyType = json['currency_type'].toString();
    _rate = json['rate'].toString();
    _isDefault = json['is_default'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _currencyCode;
  String? _currencySymbol;
  String? _currencyFullName;
  String? _currencyType;
  String? _rate;
  String? _isDefault;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get currencyCode => _currencyCode;
  String? get currencySymbol => _currencySymbol;
  String? get currencyFullName => _currencyFullName;
  String? get currencyType => _currencyType;
  String? get rate => _rate;
  String? get isDefault => _isDefault;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_code'] = _currencyCode;
    map['currency_symbol'] = _currencySymbol;
    map['currency_FullName'] = _currencyFullName;
    map['currency_type'] = _currencyType;
    map['rate'] = _rate;
    map['is_default'] = _isDefault;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

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
      dynamic currency, 
      String? description, 
      String? status, 
      List<String>? userGuards, 
      List<String>? currencies, 
      String? createdAt, 
      String? updatedAt,
      String? withdrawMinLimit,
      String? withdrawMaxLimit,}){
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
    _withdrawMinLimit = withdrawMinLimit;
    _withdrawMaxLimit = withdrawMaxLimit;
}

  WithdrawMethod.fromJson(dynamic json) {
    _id = json['id'];
    _formId = json['form_id'].toString();
    _name = json['name'].toString();
    _minLimit = json['min_limit'].toString();
    _maxLimit = json['max_limit'].toString();
    _fixedCharge = json['fixed_charge'].toString();
    _rate = json['rate'].toString();
    _percentCharge = json['percent_charge'].toString();
    _currency = json['currency'] != null ? json['currency'].toString() : "";
    _description = json['description'].toString();
    _status = json['status'].toString();
    _userGuards = json['user_guards'] != null ? json['user_guards'].cast<String>() : [];
    _currencies = json['currencies'] != null ? json['currencies'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _withdrawMinLimit = json['withdraw_min_limit'] != null ? json['withdraw_min_limit'].toString() : "0";
    _withdrawMaxLimit = json['withdraw_max_limit'] != null ? json['withdraw_max_limit'].toString() : "0";
  }
  int? _id;
  String? _formId;
  String? _name;
  String? _minLimit;
  String? _maxLimit;
  String? _fixedCharge;
  String? _rate;
  String? _percentCharge;
  dynamic _currency;
  String? _description;
  String? _status;
  List<String>? _userGuards;
  List<String>? _currencies;
  String? _createdAt;
  String? _updatedAt;
  String? _withdrawMinLimit;
  String? _withdrawMaxLimit;

  int? get id => _id;
  String? get formId => _formId;
  String? get name => _name;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get fixedCharge => _fixedCharge;
  String? get rate => _rate;
  String? get percentCharge => _percentCharge;
  dynamic get currency => _currency;
  String? get description => _description;
  String? get status => _status;
  List<String>? get userGuards => _userGuards;
  List<String>? get currencies => _currencies;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get withdrawMinLimit => _withdrawMinLimit;
  String? get withdrawMaxLimit => _withdrawMaxLimit;

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
    map['withdraw_min_limit'] = _withdrawMinLimit;
    map['withdraw_max_limit'] = _withdrawMaxLimit;
    return map;
  }

}
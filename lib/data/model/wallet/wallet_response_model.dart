import '../auth/sign_up_model/registration_response_model.dart';

class WalletResponseModel {
  WalletResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  WalletResponseModel.fromJson(dynamic json) {
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
      List<Wallets>? wallets,}){
    _wallets = wallets;
}

  Data.fromJson(dynamic json) {
    if (json['wallets'] != null) {
      _wallets = [];
      json['wallets'].forEach((v) {
        _wallets?.add(Wallets.fromJson(v));
      });
    }
  }
  List<Wallets>? _wallets;

  List<Wallets>? get wallets => _wallets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wallets != null) {
      map['wallets'] = _wallets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Wallets {
  Wallets({
      int? id, 
      String? userId, 
      String? userType, 
      String? currencyId, 
      String? currencyCode, 
      String? balance, 
      String? createdAt, 
      String? updatedAt, 
      Currency? currency,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _currencyId = currencyId;
    _currencyCode = currencyCode;
    _balance = balance;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
}

  Wallets.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'];
    _currencyId = json['currency_id'].toString();
    _currencyCode = json['currency_code'];
    _balance = json['balance'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  String? _userId;
  String? _userType;
  String? _currencyId;
  String? _currencyCode;
  String? _balance;
  String? _createdAt;
  String? _updatedAt;
  Currency? _currency;

  int? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get currencyId => _currencyId;
  String? get currencyCode => _currencyCode;
  String? get balance => _balance;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['currency_id'] = _currencyId;
    map['currency_code'] = _currencyCode;
    map['balance'] = _balance;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
      String? currencyFullname, 
      String? currencyType, 
      String? rate, 
      String? isDefault, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _currencyCode = currencyCode;
    _currencySymbol = currencySymbol;
    _currencyFullname = currencyFullname;
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
    _currencySymbol = json['currency_symbol'];
    _currencyFullname = json['currency_fullname'];
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
  String? _currencyFullname;
  String? _currencyType;
  String? _rate;
  String? _isDefault;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get currencyCode => _currencyCode;
  String? get currencySymbol => _currencySymbol;
  String? get currencyFullname => _currencyFullname;
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
    map['currency_fullname'] = _currencyFullname;
    map['currency_type'] = _currencyType;
    map['rate'] = _rate;
    map['is_default'] = _isDefault;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
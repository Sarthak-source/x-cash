import '../auth/sign_up_model/registration_response_model.dart';

class VoucherListResponseModel {
  VoucherListResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  VoucherListResponseModel.fromJson(dynamic json) {
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
      Vouchers? vouchers,}){
    _vouchers = vouchers;
}

  MainData.fromJson(dynamic json) {
    _vouchers = json['vouchers'] != null ? Vouchers.fromJson(json['vouchers']) : null;
  }
  Vouchers? _vouchers;

  Vouchers? get vouchers => _vouchers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vouchers != null) {
      map['vouchers'] = _vouchers?.toJson();
    }
    return map;
  }

}

class Vouchers {
  Vouchers({
      List<Data>? data,
      String? nextPageUrl, 
      String? path}){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Vouchers.fromJson(dynamic json) {
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
  dynamic get nextPageUrl => _nextPageUrl;
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
      String? userId, 
      String? userType, 
      String? amount, 
      String? currencyId, 
      String? voucherCode, 
      String? isUsed, 
      String? redeemerId, 
      String? createdAt, 
      String? updatedAt, 
      Currency? currency,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _amount = amount;
    _currencyId = currencyId;
    _voucherCode = voucherCode;
    _isUsed = isUsed;
    _redeemerId = redeemerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _amount = json['amount'] != null ? json['amount'].toString() : "";
    _currencyId = json['currency_id'].toString();
    _voucherCode = json['voucher_code'].toString();
    _isUsed = json['is_used'].toString();
    _redeemerId = json['redeemer_id'].toString();
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  String? _userId;
  String? _userType;
  String? _amount;
  String? _currencyId;
  String? _voucherCode;
  String? _isUsed;
  String? _redeemerId;
  String? _createdAt;
  String? _updatedAt;
  Currency? _currency;

  int? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get amount => _amount;
  String? get currencyId => _currencyId;
  String? get voucherCode => _voucherCode;
  String? get isUsed => _isUsed;
  String? get redeemerId => _redeemerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['amount'] = _amount;
    map['currency_id'] = _currencyId;
    map['voucher_code'] = _voucherCode;
    map['is_used'] = _isUsed;
    map['redeemer_id'] = _redeemerId;
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
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
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
import '../auth/sign_up_model/registration_response_model.dart';

class RedeemLogResponseModel {
  RedeemLogResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  RedeemLogResponseModel.fromJson(dynamic json) {
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
      Logs? logs,}){
    _logs = logs;
}

  MainData.fromJson(dynamic json) {
    _logs = json['logs'] != null ? Logs.fromJson(json['logs']) : null;
  }
  Logs? _logs;

  Logs? get logs => _logs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_logs != null) {
      map['logs'] = _logs?.toJson();
    }
    return map;
  }

}

class Logs {
  Logs({
      List<Data>? data,
      String? nextPageUrl,
      String? path,}){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Logs.fromJson(dynamic json) {
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
      String? userId, 
      String? userType, 
      String? amount, 
      String? currencyId, 
      String? voucherCode, 
      String? isUsed, 
      String? redeemerId, 
      String? createdAt, 
      String? updatedAt,}){
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
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
    return map;
  }

}
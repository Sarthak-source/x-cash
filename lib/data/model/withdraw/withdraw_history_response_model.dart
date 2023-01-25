import '../auth/sign_up_model/registration_response_model.dart';

class WithdrawHistoryResponseModel {
  WithdrawHistoryResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  WithdrawHistoryResponseModel.fromJson(dynamic json) {
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
      Withdraws? withdraws,}){
    _withdraws = withdraws;
}

  MainData.fromJson(dynamic json) {
    _withdraws = json['withdraws'] != null ? Withdraws.fromJson(json['withdraws']) : null;
  }
  Withdraws? _withdraws;

  Withdraws? get withdraws => _withdraws;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdraws != null) {
      map['withdraws'] = _withdraws?.toJson();
    }
    return map;
  }

}

class Withdraws {
  Withdraws({
      List<Data>? data,
      String? nextPageUrl, 
      String? path}){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Withdraws.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
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
      String? methodId, 
      String? userId, 
      String? userType, 
      String? amount, 
      String? currencyId, 
      String? walletId, 
      String? currency, 
      String? rate, 
      String? charge, 
      String? trx, 
      String? finalAmount, 
      String? afterCharge, 
      dynamic withdrawInformation, 
      String? status, 
      dynamic adminFeedback, 
      String? createdAt, 
      String? updatedAt, 
      dynamic method, 
      Curr? curr,}){
    _id = id;
    _methodId = methodId;
    _userId = userId;
    _userType = userType;
    _amount = amount;
    _currencyId = currencyId;
    _walletId = walletId;
    _currency = currency;
    _rate = rate;
    _charge = charge;
    _trx = trx;
    _finalAmount = finalAmount;
    _afterCharge = afterCharge;
    _withdrawInformation = withdrawInformation;
    _status = status;
    _adminFeedback = adminFeedback;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _method = method;
    _curr = curr;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _methodId = json['method_id'].toString();
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _amount = json['amount'] != null ? json['amount'].toString() : "";
    _currencyId = json['currency_id'].toString();
    _walletId = json['wallet_id'].toString();
    _currency = json['currency'].toString();
    _rate = json['rate'].toString();
    _charge = json['charge'].toString();
    _trx = json['trx'].toString();
    _finalAmount = json['final_amount'].toString();
    _afterCharge = json['after_charge'].toString();
    _withdrawInformation = json['withdraw_information'];
    _status = json['status'].toString();
    _adminFeedback = json['admin_feedback'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _method = json['method'];
    _curr = json['curr'] != null ? Curr.fromJson(json['curr']) : null;
  }
  int? _id;
  String? _methodId;
  String? _userId;
  String? _userType;
  String? _amount;
  String? _currencyId;
  String? _walletId;
  String? _currency;
  String? _rate;
  String? _charge;
  String? _trx;
  String? _finalAmount;
  String? _afterCharge;
  dynamic _withdrawInformation;
  String? _status;
  dynamic _adminFeedback;
  String? _createdAt;
  String? _updatedAt;
  dynamic _method;
  Curr? _curr;

  int? get id => _id;
  String? get methodId => _methodId;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get amount => _amount;
  String? get currencyId => _currencyId;
  String? get walletId => _walletId;
  String? get currency => _currency;
  String? get rate => _rate;
  String? get charge => _charge;
  String? get trx => _trx;
  String? get finalAmount => _finalAmount;
  String? get afterCharge => _afterCharge;
  dynamic get withdrawInformation => _withdrawInformation;
  String? get status => _status;
  dynamic get adminFeedback => _adminFeedback;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get method => _method;
  Curr? get curr => _curr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['method_id'] = _methodId;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['amount'] = _amount;
    map['currency_id'] = _currencyId;
    map['wallet_id'] = _walletId;
    map['currency'] = _currency;
    map['rate'] = _rate;
    map['charge'] = _charge;
    map['trx'] = _trx;
    map['final_amount'] = _finalAmount;
    map['after_charge'] = _afterCharge;
    map['withdraw_information'] = _withdrawInformation;
    map['status'] = _status;
    map['admin_feedback'] = _adminFeedback;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['method'] = _method;
    if (_curr != null) {
      map['curr'] = _curr?.toJson();
    }
    return map;
  }

}

class Curr {
  Curr({
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

  Curr.fromJson(dynamic json) {
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
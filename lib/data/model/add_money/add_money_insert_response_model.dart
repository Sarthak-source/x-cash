import '../auth/sign_up_model/registration_response_model.dart';

class AddMoneyInsertResponseModel {
  AddMoneyInsertResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  AddMoneyInsertResponseModel.fromJson(dynamic json) {
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
      Deposit? deposit, 
      String? redirectUrl,}){
    _deposit = deposit;
    _redirectUrl = redirectUrl;
}

  Data.fromJson(dynamic json) {
    _deposit = json['deposit'] != null ? Deposit.fromJson(json['deposit']) : null;
    _redirectUrl = json['redirect_url'];
  }
  Deposit? _deposit;
  String? _redirectUrl;

  Deposit? get deposit => _deposit;
  String? get redirectUrl => _redirectUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_deposit != null) {
      map['deposit'] = _deposit?.toJson();
    }
    map['redirect_url'] = _redirectUrl;
    return map;
  }

}

class Deposit {
  Deposit({
      int? userId, 
      String? userType, 
      String? walletId, 
      int? currencyId, 
      String? methodCode, 
      String? methodCurrency, 
      String? amount, 
      double? charge, 
      int? rate, 
      double? finalAmo, 
      int? btcAmo, 
      String? btcWallet, 
      String? trx, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _userId = userId;
    _userType = userType;
    _walletId = walletId;
    _currencyId = currencyId;
    _methodCode = methodCode;
    _methodCurrency = methodCurrency;
    _amount = amount;
    _charge = charge;
    _rate = rate;
    _finalAmo = finalAmo;
    _btcAmo = btcAmo;
    _btcWallet = btcWallet;
    _trx = trx;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Deposit.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userType = json['user_type'];
    _walletId = json['wallet_id'];
    _currencyId = json['currency_id'];
    _methodCode = json['method_code'];
    _methodCurrency = json['method_currency'];
    _amount = json['amount'];
    _charge = json['charge'];
    _rate = json['rate'];
    _finalAmo = json['final_amo'];
    _btcAmo = json['btc_amo'];
    _btcWallet = json['btc_wallet'];
    _trx = json['trx'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  int? _userId;
  String? _userType;
  String? _walletId;
  int? _currencyId;
  String? _methodCode;
  String? _methodCurrency;
  String? _amount;
  double? _charge;
  int? _rate;
  double? _finalAmo;
  int? _btcAmo;
  String? _btcWallet;
  String? _trx;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  int? get userId => _userId;
  String? get userType => _userType;
  String? get walletId => _walletId;
  int? get currencyId => _currencyId;
  String? get methodCode => _methodCode;
  String? get methodCurrency => _methodCurrency;
  String? get amount => _amount;
  double? get charge => _charge;
  int? get rate => _rate;
  double? get finalAmo => _finalAmo;
  int? get btcAmo => _btcAmo;
  String? get btcWallet => _btcWallet;
  String? get trx => _trx;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['wallet_id'] = _walletId;
    map['currency_id'] = _currencyId;
    map['method_code'] = _methodCode;
    map['method_currency'] = _methodCurrency;
    map['amount'] = _amount;
    map['charge'] = _charge;
    map['rate'] = _rate;
    map['final_amo'] = _finalAmo;
    map['btc_amo'] = _btcAmo;
    map['btc_wallet'] = _btcWallet;
    map['trx'] = _trx;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}
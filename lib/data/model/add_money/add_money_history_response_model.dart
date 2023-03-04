import '../auth/sign_up_model/registration_response_model.dart';

class AddMoneyHistoryResponseModel {
  AddMoneyHistoryResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  AddMoneyHistoryResponseModel.fromJson(dynamic json) {
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
      Deposits? deposits,}){
    _deposits = deposits;
}

  MainData.fromJson(dynamic json) {
    _deposits = json['deposits'] != null ? Deposits.fromJson(json['deposits']) : null;
  }
  Deposits? _deposits;

  Deposits? get deposits => _deposits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_deposits != null) {
      map['deposits'] = _deposits?.toJson();
    }
    return map;
  }

}

class Deposits {
  Deposits({
      List<DepositsData>? data,
      dynamic nextPageUrl, 
      String? path,
      }){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Deposits.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DepositsData.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
  }
  List<DepositsData>? _data;
  dynamic _nextPageUrl;
  String? _path;

  List<DepositsData>? get data => _data;
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

class DepositsData {
  DepositsData({
      int? id, 
      String? userId, 
      String? userType, 
      String? walletId, 
      String? currencyId, 
      String? methodCode, 
      String? amount, 
      String? methodCurrency, 
      String? charge, 
      String? rate, 
      String? finalAmo, 
      List<Detail>? detail, 
      String? btcAmo, 
      String? btcWallet, 
      String? trx, 
      String? paymentTry, 
      String? status, 
      String? fromApi, 
      dynamic adminFeedback, 
      String? createdAt, 
      String? updatedAt, 
      Gateway? gateway, 
      Currency? currency,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _walletId = walletId;
    _currencyId = currencyId;
    _methodCode = methodCode;
    _amount = amount;
    _methodCurrency = methodCurrency;
    _charge = charge;
    _rate = rate;
    _finalAmo = finalAmo;
    _detail = detail;
    _btcAmo = btcAmo;
    _btcWallet = btcWallet;
    _trx = trx;
    _paymentTry = paymentTry;
    _status = status;
    _fromApi = fromApi;
    _adminFeedback = adminFeedback;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _gateway = gateway;
    _currency = currency;
}

  DepositsData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _walletId = json['wallet_id'].toString();
    _currencyId = json['currency_id'].toString();
    _methodCode = json['method_code'].toString();
    _amount = json['amount'] != null ? json['amount'].toString() : "";
    _methodCurrency = json['method_currency'].toString();
    _charge = json['charge'].toString();
    _rate = json['rate'].toString();
    _finalAmo = json['final_amo'].toString();
    if (json['detail'] != null) {
      _detail = [];
      json['detail'].forEach((v) {
        _detail?.add(Detail.fromJson(v));
      });
    }
    _btcAmo = json['btc_amo'].toString();
    _btcWallet = json['btc_wallet'] != null ? json['btc_wallet'].toString() : "";
    _trx = json['trx'].toString();
    _paymentTry = json['payment_try'].toString();
    _status = json['status'].toString();
    _fromApi = json['from_api'].toString();
    _adminFeedback = json['admin_feedback'].toString();
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
    _gateway = json['gateway'] != null ? Gateway.fromJson(json['gateway']) : null;
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  int? _id;
  String? _userId;
  String? _userType;
  String? _walletId;
  String? _currencyId;
  String? _methodCode;
  String? _amount;
  String? _methodCurrency;
  String? _charge;
  String? _rate;
  String? _finalAmo;
  List<Detail>? _detail;
  String? _btcAmo;
  String? _btcWallet;
  String? _trx;
  String? _paymentTry;
  String? _status;
  String? _fromApi;
  dynamic _adminFeedback;
  String? _createdAt;
  String? _updatedAt;
  Gateway? _gateway;
  Currency? _currency;

  int? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get walletId => _walletId;
  String? get currencyId => _currencyId;
  String? get methodCode => _methodCode;
  String? get amount => _amount;
  String? get methodCurrency => _methodCurrency;
  String? get charge => _charge;
  String? get rate => _rate;
  String? get finalAmo => _finalAmo;
  List<Detail>? get detail => _detail;
  String? get btcAmo => _btcAmo;
  String? get btcWallet => _btcWallet;
  String? get trx => _trx;
  String? get paymentTry => _paymentTry;
  String? get status => _status;
  String? get fromApi => _fromApi;
  dynamic get adminFeedback => _adminFeedback;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Gateway? get gateway => _gateway;
  Currency? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['wallet_id'] = _walletId;
    map['currency_id'] = _currencyId;
    map['method_code'] = _methodCode;
    map['amount'] = _amount;
    map['method_currency'] = _methodCurrency;
    map['charge'] = _charge;
    map['rate'] = _rate;
    map['final_amo'] = _finalAmo;
    if (_detail != null) {
      map['detail'] = _detail?.map((v) => v.toJson()).toList();
    }
    map['btc_amo'] = _btcAmo;
    map['btc_wallet'] = _btcWallet;
    map['trx'] = _trx;
    map['payment_try'] = _paymentTry;
    map['status'] = _status;
    map['from_api'] = _fromApi;
    map['admin_feedback'] = _adminFeedback;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_gateway != null) {
      map['gateway'] = _gateway?.toJson();
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

class Gateway {
  Gateway({
      int? id, 
      String? currencyId, 
      String? formId, 
      String? code, 
      String? name, 
      String? alias,
      String? status,
      String? gatewayParameters,
      String? crypto, 
      dynamic extra, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _currencyId = currencyId;
    _formId = formId;
    _code = code;
    _name = name;
    _alias = alias;
    _status = status;
    _gatewayParameters = gatewayParameters;
    _crypto = crypto;
    _extra = extra;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Gateway.fromJson(dynamic json) {
    _id = json['id'];
    _currencyId = json['currency_id'].toString();
    _formId = json['form_id'].toString();
    _code = json['code'].toString();
    _name = json['name'];
    _alias = json['alias'];
    _status = json['status'].toString();
    _gatewayParameters = json['gateway_parameters'];
    _crypto = json['crypto'];
    _extra = json['extra'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _currencyId;
  String? _formId;
  String? _code;
  String? _name;
  String? _alias;
  String? _status;
  String? _gatewayParameters;
  String? _crypto;
  dynamic _extra;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get currencyId => _currencyId;
  String? get formId => _formId;
  String? get code => _code;
  String? get name => _name;
  String? get alias => _alias;
  String? get status => _status;
  String? get gatewayParameters => _gatewayParameters;
  String? get crypto => _crypto;
  dynamic get extra => _extra;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_id'] = _currencyId;
    map['form_id'] = _formId;
    map['code'] = _code;
    map['name'] = _name;
    map['alias'] = _alias;
    map['status'] = _status;
    map['gateway_parameters'] = _gatewayParameters;
    map['crypto'] = _crypto;
    map['extra'] = _extra;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Detail {
  Detail({
      String? name, 
      String? type, 
      String? value,}){
    _name = name;
    _type = type;
    _value = value;
}

  Detail.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _value = json['value'];
  }
  String? _name;
  String? _type;
  String? _value;

  String? get name => _name;
  String? get type => _type;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['value'] = _value;
    return map;
  }

}
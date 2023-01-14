import '../auth/sign_up_model/registration_response_model.dart';

class AddMoneyMethodResponseModel {
  AddMoneyMethodResponseModel({
      String? remark, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _message = message;
    _data = data;
}

  AddMoneyMethodResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _remark;
  Message? _message;
  Data? _data;

  String? get remark => _remark;
  Message? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = _remark;
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
      List<AddMoneyWallets>? wallets,}){
    _wallets = wallets;
}

  Data.fromJson(dynamic json) {
    if (json['wallets'] != null) {
      _wallets = [];
      json['wallets'].forEach((v) {
        _wallets?.add(AddMoneyWallets.fromJson(v));
      });
    }
  }
  List<AddMoneyWallets>? _wallets;

  List<AddMoneyWallets>? get wallets => _wallets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wallets != null) {
      map['wallets'] = _wallets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddMoneyWallets {
  AddMoneyWallets({
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

  AddMoneyWallets.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _currencyId = json['currency_id'].toString();
    _currencyCode = json['currency_code'].toString();
    _balance = json['balance'] != null ? json['balance'].toString() : "0.00";
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
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
      String? currencyFullName,
      String? currencyType, 
      String? rate, 
      String? isDefault, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      List<Gateways>? gateways,}){
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
    _gateways = gateways;
}

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _currencyCode = json['currency_code'].toString();
    _currencySymbol = json['currency_symbol'].toString();
    _currencyFullName = json['currency_fullName'].toString();
    _currencyType = json['currency_type'].toString();
    _rate = json['rate'].toString();
    _isDefault = json['is_default'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
    if (json['gateways'] != null) {
      _gateways = [];
      json['gateways'].forEach((v) {
        _gateways?.add(Gateways.fromJson(v));
      });
    }
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
  List<Gateways>? _gateways;

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
  List<Gateways>? get gateways => _gateways;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_code'] = _currencyCode;
    map['currency_symbol'] = _currencySymbol;
    map['currency_fullName'] = _currencyFullName;
    map['currency_type'] = _currencyType;
    map['rate'] = _rate;
    map['is_default'] = _isDefault;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_gateways != null) {
      map['gateways'] = _gateways?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Gateways {
  Gateways({
      int? id, 
      String? name, 
      String? currency, 
      String? symbol, 
      String? methodCode, 
      String? gatewayAlias, 
      String? minAmount, 
      String? maxAmount, 
      String? percentCharge, 
      String? fixedCharge, 
      String? rate, 
      dynamic image, 
      dynamic gatewayParameter, 
      String? createdAt, 
      String? updatedAt, 
      String? depositLimit,}){
    _id = id;
    _name = name;
    _currency = currency;
    _symbol = symbol;
    _methodCode = methodCode;
    _gatewayAlias = gatewayAlias;
    _minAmount = minAmount;
    _maxAmount = maxAmount;
    _percentCharge = percentCharge;
    _fixedCharge = fixedCharge;
    _rate = rate;
    _image = image;
    _gatewayParameter = gatewayParameter;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _depositLimit = depositLimit;
}

  Gateways.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _currency = json['currency'];
    _symbol = json['symbol'];
    _methodCode = json['method_code'];
    _gatewayAlias = json['gateway_alias'];
    _minAmount = json['min_amount'];
    _maxAmount = json['max_amount'];
    _percentCharge = json['percent_charge'];
    _fixedCharge = json['fixed_charge'];
    _rate = json['rate'];
    _image = json['image'];
    _gatewayParameter = json['gateway_parameter'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _depositLimit = json['deposit_limit'];
  }
  int? _id;
  String? _name;
  String? _currency;
  String? _symbol;
  String? _methodCode;
  String? _gatewayAlias;
  String? _minAmount;
  String? _maxAmount;
  String? _percentCharge;
  String? _fixedCharge;
  String? _rate;
  dynamic _image;
  dynamic _gatewayParameter;
  String? _createdAt;
  String? _updatedAt;
  String? _depositLimit;

  int? get id => _id;
  String? get name => _name;
  String? get currency => _currency;
  String? get symbol => _symbol;
  String? get methodCode => _methodCode;
  String? get gatewayAlias => _gatewayAlias;
  String? get minAmount => _minAmount;
  String? get maxAmount => _maxAmount;
  String? get percentCharge => _percentCharge;
  String? get fixedCharge => _fixedCharge;
  String? get rate => _rate;
  dynamic get image => _image;
  dynamic get gatewayParameter => _gatewayParameter;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get depositLimit => _depositLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['currency'] = _currency;
    map['symbol'] = _symbol;
    map['method_code'] = _methodCode;
    map['gateway_alias'] = _gatewayAlias;
    map['min_amount'] = _minAmount;
    map['max_amount'] = _maxAmount;
    map['percent_charge'] = _percentCharge;
    map['fixed_charge'] = _fixedCharge;
    map['rate'] = _rate;
    map['image'] = _image;
    map['gateway_parameter'] = _gatewayParameter;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deposit_limit'] = _depositLimit;
    return map;
  }

}
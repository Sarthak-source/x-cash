import '../../auth/sign_up_model/registration_response_model.dart';

class MoneyOutResponseModel {
  MoneyOutResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  MoneyOutResponseModel.fromJson(dynamic json) {
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
      List<String>? otpType, 
      List<Wallets>? wallets, 
      MoneyOutCharge? moneyOutCharge,}){
    _otpType = otpType;
    _wallets = wallets;
    _moneyOutCharge = moneyOutCharge;
}

  Data.fromJson(dynamic json) {
    _otpType = json['otp_type'] != null ? json['otp_type'].cast<String>() : [];
    if (json['wallets'] != null) {
      _wallets = [];
      json['wallets'].forEach((v) {
        _wallets?.add(Wallets.fromJson(v));
      });
    }
    _moneyOutCharge = json['money_out_charge'] != null ? MoneyOutCharge.fromJson(json['money_out_charge']) : null;
  }
  List<String>? _otpType;
  List<Wallets>? _wallets;
  MoneyOutCharge? _moneyOutCharge;

  List<String>? get otpType => _otpType;
  List<Wallets>? get wallets => _wallets;
  MoneyOutCharge? get moneyOutCharge => _moneyOutCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp_type'] = _otpType;
    if (_wallets != null) {
      map['wallets'] = _wallets?.map((v) => v.toJson()).toList();
    }
    if (_moneyOutCharge != null) {
      map['money_out_charge'] = _moneyOutCharge?.toJson();
    }
    return map;
  }

}

class MoneyOutCharge {
  MoneyOutCharge({
      int? id, 
      String? slug, 
      String? fixedCharge, 
      String? percentCharge, 
      String? minLimit, 
      String? maxLimit, 
      String? agentCommissionFixed, 
      String? agentCommissionPercent, 
      String? merchantFixedCharge, 
      String? merchantPercentCharge, 
      String? monthlyLimit, 
      String? dailyLimit, 
      String? dailyRequestAcceptLimit, 
      String? voucherLimit, 
      String? cap, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _slug = slug;
    _fixedCharge = fixedCharge;
    _percentCharge = percentCharge;
    _minLimit = minLimit;
    _maxLimit = maxLimit;
    _agentCommissionFixed = agentCommissionFixed;
    _agentCommissionPercent = agentCommissionPercent;
    _merchantFixedCharge = merchantFixedCharge;
    _merchantPercentCharge = merchantPercentCharge;
    _monthlyLimit = monthlyLimit;
    _dailyLimit = dailyLimit;
    _dailyRequestAcceptLimit = dailyRequestAcceptLimit;
    _voucherLimit = voucherLimit;
    _cap = cap;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MoneyOutCharge.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _fixedCharge = json['fixed_charge'];
    _percentCharge = json['percent_charge'];
    _minLimit = json['min_limit'];
    _maxLimit = json['max_limit'];
    _agentCommissionFixed = json['agent_commission_fixed'];
    _agentCommissionPercent = json['agent_commission_percent'];
    _merchantFixedCharge = json['merchant_fixed_charge'];
    _merchantPercentCharge = json['merchant_percent_charge'];
    _monthlyLimit = json['monthly_limit'];
    _dailyLimit = json['daily_limit'];
    _dailyRequestAcceptLimit = json['daily_request_accept_limit'];
    _voucherLimit = json['voucher_limit'];
    _cap = json['cap'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _slug;
  String? _fixedCharge;
  String? _percentCharge;
  String? _minLimit;
  String? _maxLimit;
  String? _agentCommissionFixed;
  String? _agentCommissionPercent;
  String? _merchantFixedCharge;
  String? _merchantPercentCharge;
  String? _monthlyLimit;
  String? _dailyLimit;
  String? _dailyRequestAcceptLimit;
  String? _voucherLimit;
  String? _cap;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get slug => _slug;
  String? get fixedCharge => _fixedCharge;
  String? get percentCharge => _percentCharge;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get agentCommissionFixed => _agentCommissionFixed;
  String? get agentCommissionPercent => _agentCommissionPercent;
  String? get merchantFixedCharge => _merchantFixedCharge;
  String? get merchantPercentCharge => _merchantPercentCharge;
  String? get monthlyLimit => _monthlyLimit;
  String? get dailyLimit => _dailyLimit;
  String? get dailyRequestAcceptLimit => _dailyRequestAcceptLimit;
  String? get voucherLimit => _voucherLimit;
  String? get cap => _cap;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['fixed_charge'] = _fixedCharge;
    map['percent_charge'] = _percentCharge;
    map['min_limit'] = _minLimit;
    map['max_limit'] = _maxLimit;
    map['agent_commission_fixed'] = _agentCommissionFixed;
    map['agent_commission_percent'] = _agentCommissionPercent;
    map['merchant_fixed_charge'] = _merchantFixedCharge;
    map['merchant_percent_charge'] = _merchantPercentCharge;
    map['monthly_limit'] = _monthlyLimit;
    map['daily_limit'] = _dailyLimit;
    map['daily_request_accept_limit'] = _dailyRequestAcceptLimit;
    map['voucher_limit'] = _voucherLimit;
    map['cap'] = _cap;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
    _userId = json['user_id'];
    _userType = json['user_type'];
    _currencyId = json['currency_id'];
    _currencyCode = json['currency_code'];
    _balance = json['balance'];
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
      String? updatedAt, 
      String? moneyOutLimit,}){
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
    _moneyOutLimit = moneyOutLimit;
}

  Currency.fromJson(dynamic json) {
    _id = json['id'];
    _currencyCode = json['currency_code'];
    _currencySymbol = json['currency_symbol'];
    _currencyFullname = json['currency_fullname'];
    _currencyType = json['currency_type'];
    _rate = json['rate'];
    _isDefault = json['is_default'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _moneyOutLimit = json['money_out_limit'];
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
  String? _moneyOutLimit;

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
  String? get moneyOutLimit => _moneyOutLimit;

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
    map['money_out_limit'] = _moneyOutLimit;
    return map;
  }

}
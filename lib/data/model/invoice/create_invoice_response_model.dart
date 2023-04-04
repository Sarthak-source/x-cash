import '../auth/sign_up_model/registration_response_model.dart';

class CreateInvoiceResponseModel {
  CreateInvoiceResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  CreateInvoiceResponseModel.fromJson(dynamic json) {
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
      InvoiceCharge? invoiceCharge, 
      List<Currencies>? currencies,}){
    _invoiceCharge = invoiceCharge;
    _currencies = currencies;
}

  Data.fromJson(dynamic json) {
    _invoiceCharge = json['invoice_charge'] != null ? InvoiceCharge.fromJson(json['invoice_charge']) : null;
    if (json['currencies'] != null) {
      _currencies = [];
      json['currencies'].forEach((v) {
        _currencies?.add(Currencies.fromJson(v));
      });
    }
  }
  InvoiceCharge? _invoiceCharge;
  List<Currencies>? _currencies;

  InvoiceCharge? get invoiceCharge => _invoiceCharge;
  List<Currencies>? get currencies => _currencies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invoiceCharge != null) {
      map['invoice_charge'] = _invoiceCharge?.toJson();
    }
    if (_currencies != null) {
      map['currencies'] = _currencies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Currencies {
  Currencies({
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

  Currencies.fromJson(dynamic json) {
    _id = json['id'];
    _currencyCode = json['currency_code'].toString();
    _currencySymbol = json['currency_symbol'];
    _currencyFullName = json['currency_FullName'];
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

class InvoiceCharge {
  InvoiceCharge({
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

  InvoiceCharge.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'].toString();
    _fixedCharge = json['fixed_charge'].toString();
    _percentCharge = json['percent_charge'].toString();
    _minLimit = json['min_limit'].toString();
    _maxLimit = json['max_limit'].toString();
    _agentCommissionFixed = json['agent_commission_fixed'].toString();
    _agentCommissionPercent = json['agent_commission_percent'].toString();
    _merchantFixedCharge = json['merchant_fixed_charge'].toString();
    _merchantPercentCharge = json['merchant_percent_charge'].toString();
    _monthlyLimit = json['monthly_limit'].toString();
    _dailyLimit = json['daily_limit'].toString();
    _dailyRequestAcceptLimit = json['daily_request_accept_limit'].toString();
    _voucherLimit = json['voucher_limit'].toString();
    _cap = json['cap'].toString();
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
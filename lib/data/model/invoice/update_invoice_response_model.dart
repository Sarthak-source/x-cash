import '../auth/sign_up_model/registration_response_model.dart';

class UpdateInvoiceResponseModel {
  UpdateInvoiceResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  UpdateInvoiceResponseModel.fromJson(dynamic json) {
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
      Invoice? invoice, 
      List<InvoiceItems>? invoiceItems, 
      List<Currencies>? currencies, 
      InvoiceCharge? invoiceCharge,}){
    _invoice = invoice;
    _invoiceItems = invoiceItems;
    _currencies = currencies;
    _invoiceCharge = invoiceCharge;
}

  Data.fromJson(dynamic json) {
    _invoice = json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    if (json['invoice_items'] != null) {
      _invoiceItems = [];
      json['invoice_items'].forEach((v) {
        _invoiceItems?.add(InvoiceItems.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      _currencies = [];
      json['currencies'].forEach((v) {
        _currencies?.add(Currencies.fromJson(v));
      });
    }
    _invoiceCharge = json['invoice_charge'] != null ? InvoiceCharge.fromJson(json['invoice_charge']) : null;
  }
  Invoice? _invoice;
  List<InvoiceItems>? _invoiceItems;
  List<Currencies>? _currencies;
  InvoiceCharge? _invoiceCharge;

  Invoice? get invoice => _invoice;
  List<InvoiceItems>? get invoiceItems => _invoiceItems;
  List<Currencies>? get currencies => _currencies;
  InvoiceCharge? get invoiceCharge => _invoiceCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invoice != null) {
      map['invoice'] = _invoice?.toJson();
    }
    if (_invoiceItems != null) {
      map['invoice_items'] = _invoiceItems?.map((v) => v.toJson()).toList();
    }
    if (_currencies != null) {
      map['currencies'] = _currencies?.map((v) => v.toJson()).toList();
    }
    if (_invoiceCharge != null) {
      map['invoice_charge'] = _invoiceCharge?.toJson();
    }
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
    _slug = json['slug'];
    _fixedCharge = json['fixed_charge'].toString();
    _percentCharge = json['percent_charge'].toString();
    _minLimit = json['min_limit'] != null ? json['min_limit'].toString() : "0";
    _maxLimit = json['max_limit'] != null ? json['max_limit'].toString() : "0";
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
    _currencyFullName = json['currency_fullname'];
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
    map['currency_fullname'] = _currencyFullName;
    map['currency_type'] = _currencyType;
    map['rate'] = _rate;
    map['is_default'] = _isDefault;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class InvoiceItems {
  InvoiceItems({
      int? id, 
      String? invoiceId, 
      String? itemName, 
      String? amount, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _invoiceId = invoiceId;
    _itemName = itemName;
    _amount = amount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  InvoiceItems.fromJson(dynamic json) {
    _id = json['id'];
    _invoiceId = json['invoice_id'].toString();
    _itemName = json['item_name'].toString();
    _amount = json['amount'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _invoiceId;
  String? _itemName;
  String? _amount;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get invoiceId => _invoiceId;
  String? get itemName => _itemName;
  String? get amount => _amount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['invoice_id'] = _invoiceId;
    map['item_name'] = _itemName;
    map['amount'] = _amount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Invoice {
  Invoice({
      int? id, 
      String? userId, 
      String? currencyId, 
      String? userType, 
      String? invoiceNum, 
      String? invoiceTo, 
      String? email, 
      String? address, 
      String? charge, 
      String? totalAmount, 
      String? getAmount, 
      String? payStatus, 
      String? status, 
      String? createdAt, 
      String? updatedAt,
      String? link,}){

    _id = id;
    _userId = userId;
    _currencyId = currencyId;
    _userType = userType;
    _invoiceNum = invoiceNum;
    _invoiceTo = invoiceTo;
    _email = email;
    _address = address;
    _charge = charge;
    _totalAmount = totalAmount;
    _getAmount = getAmount;
    _payStatus = payStatus;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _link = link;
}

  Invoice.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _currencyId = json['currency_id'].toString();
    _userType = json['user_type'].toString();
    _invoiceNum = json['invoice_num'].toString();
    _invoiceTo = json['invoice_to'].toString();
    _email = json['email'].toString();
    _address = json['address'].toString();
    _charge = json['charge'].toString();
    _totalAmount = json['total_amount'].toString();
    _getAmount = json['get_amount'].toString();
    _payStatus = json['pay_status'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _link = json['link'];
  }
  int? _id;
  String? _userId;
  String? _currencyId;
  String? _userType;
  String? _invoiceNum;
  String? _invoiceTo;
  String? _email;
  String? _address;
  String? _charge;
  String? _totalAmount;
  String? _getAmount;
  String? _payStatus;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _link;

  int? get id => _id;
  String? get userId => _userId;
  String? get currencyId => _currencyId;
  String? get userType => _userType;
  String? get invoiceNum => _invoiceNum;
  String? get invoiceTo => _invoiceTo;
  String? get email => _email;
  String? get address => _address;
  String? get charge => _charge;
  String? get totalAmount => _totalAmount;
  String? get getAmount => _getAmount;
  String? get payStatus => _payStatus;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['currency_id'] = _currencyId;
    map['user_type'] = _userType;
    map['invoice_num'] = _invoiceNum;
    map['invoice_to'] = _invoiceTo;
    map['email'] = _email;
    map['address'] = _address;
    map['charge'] = _charge;
    map['total_amount'] = _totalAmount;
    map['get_amount'] = _getAmount;
    map['pay_status'] = _payStatus;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['link'] = _link;
    return map;
  }

}
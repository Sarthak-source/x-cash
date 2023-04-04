import '../auth/sign_up_model/registration_response_model.dart';

class InvoiceHistoryResponseModel {
  InvoiceHistoryResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  InvoiceHistoryResponseModel.fromJson(dynamic json) {
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
      Invoices? invoices,}){
    _invoices = invoices;
}

  MainData.fromJson(dynamic json) {
    _invoices = json['invoices'] != null ? Invoices.fromJson(json['invoices']) : null;
  }
  Invoices? _invoices;

  Invoices? get invoices => _invoices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invoices != null) {
      map['invoices'] = _invoices?.toJson();
    }
    return map;
  }

}

class Invoices {
  Invoices({
      List<Data>? data,
      String? nextPageUrl, 
      String? path, 
      }){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Invoices.fromJson(dynamic json) {
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
      String? link, 
      List<Items>? items, 
      Currency? currency,}){
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
    _items = items;
    _currency = currency;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _currencyId = json['currency_id'].toString();
    _userType = json['user_type'];
    _invoiceNum = json['invoice_num'].toString();
    _invoiceTo = json['invoice_to'].toString();
    _email = json['email'];
    _address = json['address'];
    _charge = json['charge'].toString();
    _totalAmount = json['total_amount'].toString();
    _getAmount = json['get_amount'].toString();
    _payStatus = json['pay_status'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _link = json['link'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
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
  List<Items>? _items;
  Currency? _currency;

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
  List<Items>? get items => _items;
  Currency? get currency => _currency;

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
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
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

class Items {
  Items({
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

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _invoiceId = json['invoice_id'].toString();
    _itemName = json['item_name'];
    _amount = json['amount'] != null ? json['amount'].toString() : "0";
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
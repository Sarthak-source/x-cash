import '../auth/sign_up_model/registration_response_model.dart';

class TransactionResponseModel {
  TransactionResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  TransactionResponseModel.fromJson(dynamic json) {
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
      List<String>? operations, 
      List<String>? times, 
      List<String>? currencies, 
      Transactions? transactions,}){
    _operations = operations;
    _times = times;
    _currencies = currencies;
    _transactions = transactions;
}

  MainData.fromJson(dynamic json) {
    _operations = json['operations'] != null ? json['operations'].cast<String>() : [];
    _times = json['times'] != null ? json['times'].cast<String>() : [];
    _currencies = json['currencies'] != null ? json['currencies'].cast<String>() : [];
    _transactions = json['transactions'] != null ? Transactions.fromJson(json['transactions']) : null;
  }
  List<String>? _operations;
  List<String>? _times;
  List<String>? _currencies;
  Transactions? _transactions;

  List<String>? get operations => _operations;
  List<String>? get times => _times;
  List<String>? get currencies => _currencies;
  Transactions? get transactions => _transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['operations'] = _operations;
    map['times'] = _times;
    map['currencies'] = _currencies;
    if (_transactions != null) {
      map['transactions'] = _transactions?.toJson();
    }
    return map;
  }

}

class Transactions {
  Transactions({
    List<Data>? data,
    String? nextPageUrl,
    String? path}) {
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
  }

  Transactions.fromJson(dynamic json) {
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

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;

  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? userId, 
      String? userType, 
      String? receiverId, 
      String? receiverType, 
      String? currencyId, 
      String? walletId, 
      String? beforeCharge, 
      String? amount, 
      String? charge, 
      String? postBalance, 
      String? trxType, 
      String? chargeType, 
      String? trx, 
      String? details, 
      String? remark, 
      String? createdAt, 
      String? updatedAt,
      String? apiDetails,
      Currency? currency,
      ReceiverUser? receiverUser, 
      dynamic receiverAgent, 
      dynamic receiverMerchant,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _receiverId = receiverId;
    _receiverType = receiverType;
    _currencyId = currencyId;
    _walletId = walletId;
    _beforeCharge = beforeCharge;
    _amount = amount;
    _charge = charge;
    _postBalance = postBalance;
    _trxType = trxType;
    _chargeType = chargeType;
    _trx = trx;
    _details = details;
    _remark = remark;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _apiDetails = apiDetails;
    _currency = currency;
    _receiverUser = receiverUser;
    _receiverAgent = receiverAgent;
    _receiverMerchant = receiverMerchant;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'];
    _receiverId = json['receiver_id'].toString();
    _receiverType = json['receiver_type'];
    _currencyId = json['currency_id'].toString();
    _walletId = json['wallet_id'].toString();
    _beforeCharge = json['before_charge'].toString();
    _amount = json['amount'] != null ? json['amount'].toString() : "";
    _charge = json['charge'].toString();
    _postBalance = json['post_balance'].toString();
    _trxType = json['trx_type'].toString();
    _chargeType = json['charge_type'].toString();
    _trx = json['trx'];
    _details = json['details'];
    _remark = json['remark'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _apiDetails = json['apiDetails'];
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    _receiverUser = json['receiver_user'] != null ? ReceiverUser.fromJson(json['receiver_user']) : null;
    _receiverAgent = json['receiver_agent'];
    _receiverMerchant = json['receiver_merchant'];
  }
  int? _id;
  String? _userId;
  String? _userType;
  String? _receiverId;
  String? _receiverType;
  String? _currencyId;
  String? _walletId;
  String? _beforeCharge;
  String? _amount;
  String? _charge;
  String? _postBalance;
  String? _trxType;
  String? _chargeType;
  String? _trx;
  String? _details;
  String? _remark;
  String? _createdAt;
  String? _updatedAt;
  String? _apiDetails;
  Currency? _currency;
  ReceiverUser? _receiverUser;
  dynamic _receiverAgent;
  dynamic _receiverMerchant;

  int? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get receiverId => _receiverId;
  String? get receiverType => _receiverType;
  String? get currencyId => _currencyId;
  String? get walletId => _walletId;
  String? get beforeCharge => _beforeCharge;
  String? get amount => _amount;
  String? get charge => _charge;
  String? get postBalance => _postBalance;
  String? get trxType => _trxType;
  String? get chargeType => _chargeType;
  String? get trx => _trx;
  String? get details => _details;
  String? get remark => _remark;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get apiDetails => _apiDetails;
  Currency? get currency => _currency;
  ReceiverUser? get receiverUser => _receiverUser;
  dynamic get receiverAgent => _receiverAgent;
  dynamic get receiverMerchant => _receiverMerchant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['receiver_id'] = _receiverId;
    map['receiver_type'] = _receiverType;
    map['currency_id'] = _currencyId;
    map['wallet_id'] = _walletId;
    map['before_charge'] = _beforeCharge;
    map['amount'] = _amount;
    map['charge'] = _charge;
    map['post_balance'] = _postBalance;
    map['trx_type'] = _trxType;
    map['charge_type'] = _chargeType;
    map['trx'] = _trx;
    map['details'] = _details;
    map['remark'] = _remark;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['apiDetails'] = _apiDetails;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    if (_receiverUser != null) {
      map['receiver_user'] = _receiverUser?.toJson();
    }
    map['receiver_agent'] = _receiverAgent;
    map['receiver_merchant'] = _receiverMerchant;
    return map;
  }

}

class ReceiverUser {
  ReceiverUser({
      int? id, 
      dynamic companyName, 
      String? firstname, 
      String? lastname, 
      String? username, 
      String? email, 
      String? countryCode, 
      String? mobile, 
      String? refBy, 
      String? balance, 
      dynamic image, 
      Address? address, 
      String? status, 
      dynamic kycData, 
      String? kv, 
      String? ev, 
      String? sv, 
      String? profileComplete, 
      String? verCodeSendAt, 
      String? ts, 
      String? tv, 
      dynamic tsc, 
      dynamic banReason, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _companyName = companyName;
    _firstname = firstname;
    _lastname = lastname;
    _username = username;
    _email = email;
    _countryCode = countryCode;
    _mobile = mobile;
    _refBy = refBy;
    _balance = balance;
    _image = image;
    _address = address;
    _status = status;
    _kycData = kycData;
    _kv = kv;
    _ev = ev;
    _sv = sv;
    _profileComplete = profileComplete;
    _verCodeSendAt = verCodeSendAt;
    _ts = ts;
    _tv = tv;
    _tsc = tsc;
    _banReason = banReason;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ReceiverUser.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'] != null ? _companyName = json['company_name'].toString() : "";
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _username = json['username'];
    _email = json['email'];
    _countryCode = json['country_code'].toString();
    _mobile = json['mobile'];
    _refBy = json['ref_by'].toString();
    _balance = json['balance'];
    _image = json['image'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _status = json['status'];
    _kycData = json['kyc_data'];
    _kv = json['kv'];
    _ev = json['ev'];
    _sv = json['sv'];
    _profileComplete = json['profile_complete'];
    _verCodeSendAt = json['ver_code_send_at'];
    _ts = json['ts'];
    _tv = json['tv'];
    _tsc = json['tsc'];
    _banReason = json['ban_reason'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  dynamic _companyName;
  String? _firstname;
  String? _lastname;
  String? _username;
  String? _email;
  String? _countryCode;
  String? _mobile;
  String? _refBy;
  String? _balance;
  dynamic _image;
  Address? _address;
  String? _status;
  dynamic _kycData;
  String? _kv;
  String? _ev;
  String? _sv;
  String? _profileComplete;
  String? _verCodeSendAt;
  String? _ts;
  String? _tv;
  dynamic _tsc;
  dynamic _banReason;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  dynamic get companyName => _companyName;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get username => _username;
  String? get email => _email;
  String? get countryCode => _countryCode;
  String? get mobile => _mobile;
  String? get refBy => _refBy;
  String? get balance => _balance;
  dynamic get image => _image;
  Address? get address => _address;
  String? get status => _status;
  dynamic get kycData => _kycData;
  String? get kv => _kv;
  String? get ev => _ev;
  String? get sv => _sv;
  String? get profileComplete => _profileComplete;
  String? get verCodeSendAt => _verCodeSendAt;
  String? get ts => _ts;
  String? get tv => _tv;
  dynamic get tsc => _tsc;
  dynamic get banReason => _banReason;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_name'] = _companyName;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['email'] = _email;
    map['country_code'] = _countryCode;
    map['mobile'] = _mobile;
    map['ref_by'] = _refBy;
    map['balance'] = _balance;
    map['image'] = _image;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['status'] = _status;
    map['kyc_data'] = _kycData;
    map['kv'] = _kv;
    map['ev'] = _ev;
    map['sv'] = _sv;
    map['profile_complete'] = _profileComplete;
    map['ver_code_send_at'] = _verCodeSendAt;
    map['ts'] = _ts;
    map['tv'] = _tv;
    map['tsc'] = _tsc;
    map['ban_reason'] = _banReason;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Address {
  Address({
      String? country, 
      dynamic address, 
      dynamic state, 
      dynamic zip, 
      dynamic city,}){
    _country = country;
    _address = address;
    _state = state;
    _zip = zip;
    _city = city;
}

  Address.fromJson(dynamic json) {
    _country = json['country'];
    _address = json['address'];
    _state = json['state'];
    _zip = json['zip'];
    _city = json['city'];
  }
  String? _country;
  dynamic _address;
  dynamic _state;
  dynamic _zip;
  dynamic _city;

  String? get country => _country;
  dynamic get address => _address;
  dynamic get state => _state;
  dynamic get zip => _zip;
  dynamic get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['address'] = _address;
    map['state'] = _state;
    map['zip'] = _zip;
    map['city'] = _city;
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
    _currencyType = json['currency_type'];
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
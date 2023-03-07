import '../auth/sign_up_model/registration_response_model.dart';

class HomeResponseModel {
  HomeResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  HomeResponseModel.fromJson(dynamic json) {
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
      User? user, 
      List<Wallets>? wallets, 
      List<LatestTrx>? latestTrx, 
      Last7DayMoneyInOut? last7DayMoneyInOut, 
      String? totalSiteBalance,}){
    _user = user;
    _wallets = wallets;
    _latestTrx = latestTrx;
    _last7DayMoneyInOut = last7DayMoneyInOut;
    _totalSiteBalance = totalSiteBalance;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['wallets'] != null) {
      _wallets = [];
      json['wallets'].forEach((v) {
        _wallets?.add(Wallets.fromJson(v));
      });
    }
    if (json['latest_trx'] != null) {
      _latestTrx = [];
      json['latest_trx'].forEach((v) {
        _latestTrx?.add(LatestTrx.fromJson(v));
      });
    }
    _last7DayMoneyInOut = json['last_7_day_money_in_out'] != null ? Last7DayMoneyInOut.fromJson(json['last_7_day_money_in_out']) : null;
    _totalSiteBalance = json['total_site_balance'];
  }
  User? _user;
  List<Wallets>? _wallets;
  List<LatestTrx>? _latestTrx;
  Last7DayMoneyInOut? _last7DayMoneyInOut;
  String? _totalSiteBalance;

  User? get user => _user;
  List<Wallets>? get wallets => _wallets;
  List<LatestTrx>? get latestTrx => _latestTrx;
  Last7DayMoneyInOut? get last7DayMoneyInOut => _last7DayMoneyInOut;
  String? get totalSiteBalance => _totalSiteBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_wallets != null) {
      map['wallets'] = _wallets?.map((v) => v.toJson()).toList();
    }
    if (_latestTrx != null) {
      map['latest_trx'] = _latestTrx?.map((v) => v.toJson()).toList();
    }
    if (_last7DayMoneyInOut != null) {
      map['last_7_day_money_in_out'] = _last7DayMoneyInOut?.toJson();
    }
    map['total_site_balance'] = _totalSiteBalance;
    return map;
  }

}

class Last7DayMoneyInOut {
  Last7DayMoneyInOut({
      String? totalMoneyIn,
      String? totalMoneyOut,}){
    _totalMoneyIn = totalMoneyIn;
    _totalMoneyOut = totalMoneyOut;
}

  Last7DayMoneyInOut.fromJson(dynamic json) {
    _totalMoneyIn = json['totalMoneyIn'].toString();
    _totalMoneyOut = json['totalMoneyOut'].toString();
  }
  String? _totalMoneyIn;
  String? _totalMoneyOut;

  String? get totalMoneyIn => _totalMoneyIn;
  String? get totalMoneyOut => _totalMoneyOut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalMoneyIn'] = _totalMoneyIn;
    map['totalMoneyOut'] = _totalMoneyOut;
    return map;
  }

}

class LatestTrx {
  LatestTrx({
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
      ReceiverAgent? receiverAgent, 
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

  LatestTrx.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'];
    _receiverId = json['receiver_id'].toString();
    _receiverType = json['receiver_type'];
    _currencyId = json['currency_id'].toString();
    _walletId = json['wallet_id'].toString();
    _beforeCharge = json['before_charge'].toString();
    _amount = json['amount'].toString();
    _charge = json['charge'].toString();
    _postBalance = json['post_balance'].toString();
    _trxType = json['trx_type'];
    _chargeType = json['charge_type'];
    _trx = json['trx'];
    _details = json['details'];
    _remark = json['remark'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _apiDetails = json['apiDetails'];
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    _receiverUser = json['receiver_user'] != null ? ReceiverUser.fromJson(json['receiver_user']) : null;
    _receiverAgent = json['receiver_agent'] != null ? ReceiverAgent.fromJson(json['receiver_agent']) : null;
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
  ReceiverAgent? _receiverAgent;
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
  ReceiverAgent? get receiverAgent => _receiverAgent;
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
    if (_receiverAgent != null) {
      map['receiver_agent'] = _receiverAgent?.toJson();
    }
    map['receiver_merchant'] = _receiverMerchant;
    return map;
  }

}

class ReceiverAgent {
  ReceiverAgent({
      int? id, 
      String? firstname, 
      String? lastname, 
      String? username, 
      String? email, 
      String? countryCode, 
      String? mobile, 
      String? refBy, 
      String? balance, 
      String? password, 
      dynamic image, 
      Address? address, 
      String? status, 
      String? kv, 
      List<KycData>? kycData, 
      String? ev, 
      String? sv, 
      String? profileComplete, 
      dynamic verCode, 
      dynamic verCodeSendAt, 
      String? ts, 
      String? tv, 
      dynamic tsc, 
      dynamic banReason, 
      dynamic rememberToken, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _firstname = firstname;
    _lastname = lastname;
    _username = username;
    _email = email;
    _countryCode = countryCode;
    _mobile = mobile;
    _refBy = refBy;
    _balance = balance;
    _password = password;
    _image = image;
    _address = address;
    _status = status;
    _kv = kv;
    _kycData = kycData;
    _ev = ev;
    _sv = sv;
    _profileComplete = profileComplete;
    _verCode = verCode;
    _verCodeSendAt = verCodeSendAt;
    _ts = ts;
    _tv = tv;
    _tsc = tsc;
    _banReason = banReason;
    _rememberToken = rememberToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ReceiverAgent.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'] ?? "";
    _lastname = json['lastname'] ?? "";
    _username = json['username'] ?? "";
    _email = json['email'] ?? "";
    _countryCode = json['country_code'].toString();
    _mobile = json['mobile'];
    _refBy = json['ref_by'].toString();
    _balance = json['balance'].toString();
    _password = json['password'];
    _image = json['image'].toString();
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _status = json['status'].toString();
    _kv = json['kv'].toString();
    if (json['kyc_data'] != null) {
      _kycData = [];
      json['kyc_data'].forEach((v) {
        _kycData?.add(KycData.fromJson(v));
      });
    }
    _ev = json['ev'].toString();
    _sv = json['sv'].toString();
    _profileComplete = json['profile_complete'].toString();
    _verCode = json['ver_code'].toString();
    _verCodeSendAt = json['ver_code_send_at'];
    _ts = json['ts'].toString();
    _tv = json['tv'].toString();
    _tsc = json['tsc'].toString();
    _banReason = json['ban_reason'].toString();
    _rememberToken = json['remember_token'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _username;
  String? _email;
  String? _countryCode;
  String? _mobile;
  String? _refBy;
  String? _balance;
  String? _password;
  dynamic _image;
  Address? _address;
  String? _status;
  String? _kv;
  List<KycData>? _kycData;
  String? _ev;
  String? _sv;
  String? _profileComplete;
  dynamic _verCode;
  dynamic _verCodeSendAt;
  String? _ts;
  String? _tv;
  dynamic _tsc;
  dynamic _banReason;
  dynamic _rememberToken;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get username => _username;
  String? get email => _email;
  String? get countryCode => _countryCode;
  String? get mobile => _mobile;
  String? get refBy => _refBy;
  String? get balance => _balance;
  String? get password => _password;
  dynamic get image => _image;
  Address? get address => _address;
  String? get status => _status;
  String? get kv => _kv;
  List<KycData>? get kycData => _kycData;
  String? get ev => _ev;
  String? get sv => _sv;
  String? get profileComplete => _profileComplete;
  dynamic get verCode => _verCode;
  dynamic get verCodeSendAt => _verCodeSendAt;
  String? get ts => _ts;
  String? get tv => _tv;
  dynamic get tsc => _tsc;
  dynamic get banReason => _banReason;
  dynamic get rememberToken => _rememberToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['email'] = _email;
    map['country_code'] = _countryCode;
    map['mobile'] = _mobile;
    map['ref_by'] = _refBy;
    map['balance'] = _balance;
    map['password'] = _password;
    map['image'] = _image;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['status'] = _status;
    map['kv'] = _kv;
    if (_kycData != null) {
      map['kyc_data'] = _kycData?.map((v) => v.toJson()).toList();
    }
    map['ev'] = _ev;
    map['sv'] = _sv;
    map['profile_complete'] = _profileComplete;
    map['ver_code'] = _verCode;
    map['ver_code_send_at'] = _verCodeSendAt;
    map['ts'] = _ts;
    map['tv'] = _tv;
    map['tsc'] = _tsc;
    map['ban_reason'] = _banReason;
    map['remember_token'] = _rememberToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class KycData {
  KycData({
      String? name, 
      String? type, 
      String? value,}){
    _name = name;
    _type = type;
    _value = value;
}

  KycData.fromJson(dynamic json) {
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

class ReceiverUser {
  ReceiverUser({
      int? id, 
      String? companyName, 
      dynamic firstname, 
      dynamic lastname, 
      String? username, 
      String? email, 
      String? countryCode, 
      String? mobile, 
      String? refBy, 
      String? balance, 
      dynamic image, 
      ReceiverAddress? address,
      String? status, 
      dynamic kycData, 
      String? kv, 
      String? ev, 
      String? sv, 
      String? profileComplete, 
      dynamic verCodeSendAt, 
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
    _companyName = json['company_name'] ?? "";
    _firstname = json['firstname'] ?? "";
    _lastname = json['lastname'] ?? "";
    _username = json['username'] ?? "";
    _email = json['email'] ?? "";
    _countryCode = json['country_code'].toString();
    _mobile = json['mobile'];
    _refBy = json['ref_by'].toString();
    _balance = json['balance'].toString();
    _image = json['image'].toString();
    _address = json['address'] != null ? ReceiverAddress.fromJson(json['address']) : null;
    _status = json['status'].toString();
    _kycData = json['kyc_data'];
    _kv = json['kv'].toString();
    _ev = json['ev'].toString();
    _sv = json['sv'].toString();
    _profileComplete = json['profile_complete'].toString();
    _verCodeSendAt = json['ver_code_send_at'];
    _ts = json['ts'].toString();
    _tv = json['tv'].toString();
    _tsc = json['tsc'].toString();
    _banReason = json['ban_reason'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _companyName;
  dynamic _firstname;
  dynamic _lastname;
  String? _username;
  String? _email;
  String? _countryCode;
  String? _mobile;
  String? _refBy;
  String? _balance;
  dynamic _image;
  ReceiverAddress? _address;
  String? _status;
  dynamic _kycData;
  String? _kv;
  String? _ev;
  String? _sv;
  String? _profileComplete;
  dynamic _verCodeSendAt;
  String? _ts;
  String? _tv;
  dynamic _tsc;
  dynamic _banReason;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get companyName => _companyName;
  dynamic get firstname => _firstname;
  dynamic get lastname => _lastname;
  String? get username => _username;
  String? get email => _email;
  String? get countryCode => _countryCode;
  String? get mobile => _mobile;
  String? get refBy => _refBy;
  String? get balance => _balance;
  dynamic get image => _image;
  ReceiverAddress? get address => _address;
  String? get status => _status;
  dynamic get kycData => _kycData;
  String? get kv => _kv;
  String? get ev => _ev;
  String? get sv => _sv;
  String? get profileComplete => _profileComplete;
  dynamic get verCodeSendAt => _verCodeSendAt;
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

class ReceiverAddress {
  ReceiverAddress({
      String? address, 
      String? state, 
      String? zip, 
      String? country, 
      String? city,}){
    _address = address;
    _state = state;
    _zip = zip;
    _country = country;
    _city = city;
}

  ReceiverAddress.fromJson(dynamic json) {
    _address = json['address'];
    _state = json['state'];
    _zip = json['zip'];
    _country = json['country'];
    _city = json['city'];
  }
  String? _address;
  String? _state;
  String? _zip;
  String? _country;
  String? _city;

  String? get address => _address;
  String? get state => _state;
  String? get zip => _zip;
  String? get country => _country;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['state'] = _state;
    map['zip'] = _zip;
    map['country'] = _country;
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
      String? transactions,
    WalletsCurrency? currency,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _currencyId = currencyId;
    _currencyCode = currencyCode;
    _balance = balance;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _transactions = transactions;
    _currency = currency;
}

  Wallets.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'].toString();
    _userType = json['user_type'];
    _currencyId = json['currency_id'].toString();
    _currencyCode = json['currency_code'].toString();
    _balance = json['balance'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _transactions = json['transactions'];
    _currency = json['currency'] != null ? WalletsCurrency.fromJson(json['currency']) : null;
  }
  int? _id;
  String? _userId;
  String? _userType;
  String? _currencyId;
  String? _currencyCode;
  String? _balance;
  String? _createdAt;
  String? _updatedAt;
  String? _transactions;
  WalletsCurrency? _currency;

  int? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get currencyId => _currencyId;
  String? get currencyCode => _currencyCode;
  String? get balance => _balance;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get transactions => _transactions;
  WalletsCurrency? get currency => _currency;

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
    map['transactions'] = _transactions;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    return map;
  }

}

class WalletsCurrency {
  WalletsCurrency({
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

  WalletsCurrency.fromJson(dynamic json) {
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

class User {
  User({
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
      String? image, 
      UserAddress? address,
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

  User.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'] ?? "";
    _firstname = json['firstname'] ?? "";
    _lastname = json['lastname'] ?? "";
    _username = json['username'] ?? "";
    _email = json['email'] ?? "";
    _countryCode = json['country_code'].toString();
    _mobile = json['mobile'];
    _refBy = json['ref_by'].toString();
    _balance = json['balance'].toString();
    _image = json['image'].toString();
    _address = json['address'] != null ? UserAddress.fromJson(json['address']) : null;
    _status = json['status'].toString();
    _kycData = json['kyc_data'];
    _kv = json['kv'].toString();
    _ev = json['ev'].toString();
    _sv = json['sv'].toString();
    _profileComplete = json['profile_complete'].toString();
    _verCodeSendAt = json['ver_code_send_at'];
    _ts = json['ts'].toString();
    _tv = json['tv'].toString();
    _tsc = json['tsc'].toString();
    _banReason = json['ban_reason'].toString();
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
  String? _image;
  UserAddress? _address;
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
  String? get image => _image;
  UserAddress? get address => _address;
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

class UserAddress {
  UserAddress({
      String? country, 
      String? address, 
      String? state, 
      String? zip, 
      String? city,}){
    _country = country;
    _address = address;
    _state = state;
    _zip = zip;
    _city = city;
}

  UserAddress.fromJson(dynamic json) {
    _country = json['country'];
    _address = json['address'];
    _state = json['state'];
    _zip = json['zip'];
    _city = json['city'];
  }
  String? _country;
  String? _address;
  String? _state;
  String? _zip;
  String? _city;

  String? get country => _country;
  String? get address => _address;
  String? get state => _state;
  String? get zip => _zip;
  String? get city => _city;

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
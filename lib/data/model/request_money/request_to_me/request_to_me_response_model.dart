import '../../auth/sign_up_model/registration_response_model.dart';

class RequestToMeResponseModel {
  RequestToMeResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  RequestToMeResponseModel.fromJson(dynamic json) {
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
      Requests? requests,}){
    _requests = requests;
}

  MainData.fromJson(dynamic json) {
    _requests = json['requests'] != null ? Requests.fromJson(json['requests']) : null;
  }
  Requests? _requests;

  Requests? get requests => _requests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_requests != null) {
      map['requests'] = _requests?.toJson();
    }
    return map;
  }

}

class Requests {
  Requests({
      List<Data>? data,
      String? nextPageUrl,
      String? path, 
      }){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
}

  Requests.fromJson(dynamic json) {
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
      String? currencyId, 
      String? walletId, 
      String? charge, 
      String? requestAmount, 
      String? senderId, 
      String? receiverId, 
      String? note, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      Currency? currency, 
      Sender? sender,}){
    _id = id;
    _currencyId = currencyId;
    _walletId = walletId;
    _charge = charge;
    _requestAmount = requestAmount;
    _senderId = senderId;
    _receiverId = receiverId;
    _note = note;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
    _sender = sender;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _currencyId = json['currency_id'].toString();
    _walletId = json['wallet_id'].toString();
    _charge = json['charge'].toString();
    _requestAmount = json['request_amount'].toString();
    _senderId = json['sender_id'].toString();
    _receiverId = json['receiver_id'].toString();
    _note = json['note'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
    _currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    _sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
  }
  int? _id;
  String? _currencyId;
  String? _walletId;
  String? _charge;
  String? _requestAmount;
  String? _senderId;
  String? _receiverId;
  String? _note;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  Currency? _currency;
  Sender? _sender;

  int? get id => _id;
  String? get currencyId => _currencyId;
  String? get walletId => _walletId;
  String? get charge => _charge;
  String? get requestAmount => _requestAmount;
  String? get senderId => _senderId;
  String? get receiverId => _receiverId;
  String? get note => _note;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Currency? get currency => _currency;
  Sender? get sender => _sender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['currency_id'] = _currencyId;
    map['wallet_id'] = _walletId;
    map['charge'] = _charge;
    map['request_amount'] = _requestAmount;
    map['sender_id'] = _senderId;
    map['receiver_id'] = _receiverId;
    map['note'] = _note;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    if (_sender != null) {
      map['sender'] = _sender?.toJson();
    }
    return map;
  }

}

class Sender {
  Sender({
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

  Sender.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _username = json['username'];
    _email = json['email'];
    _countryCode = json['country_code'];
    _mobile = json['mobile'];
    _refBy = json['ref_by'];
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
    _currencyCode = json['currency_code'];
    _currencySymbol = json['currency_symbol'];
    _currencyFullname = json['currency_fullname'];
    _currencyType = json['currency_type'];
    _rate = json['rate'];
    _isDefault = json['is_default'];
    _status = json['status'];
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
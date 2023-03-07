import '../auth/sign_up_model/registration_response_model.dart';

class CheckUserResponseModel {
  CheckUserResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  CheckUserResponseModel.fromJson(dynamic json) {
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
      Agent? agent,}){
    _agent = agent;
}

  Data.fromJson(dynamic json) {
    _agent = json['agent'] != null ? Agent.fromJson(json['agent']) : null;
  }
  Agent? _agent;

  Agent? get agent => _agent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_agent != null) {
      map['agent'] = _agent?.toJson();
    }
    return map;
  }

}

class Agent {
  Agent({
      int? id,
      String? companyName,
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

  Agent.fromJson(dynamic json) {
    _id = json['id'];
    _companyName = json['company_name'] != null ? json['company_name'].toString() : "";
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _username = json['username'];
    _email = json['email'];
    _countryCode = json['country_code'].toString();
    _mobile = json['mobile'];
    _refBy = json['ref_by'].toString();
    _balance = json['balance'] != null ? json['balance'].toString() : "";
    _image = json['image'].toString();
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
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
  dynamic _verCodeSendAt;
  String? _ts;
  String? _tv;
  dynamic _tsc;
  dynamic _banReason;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get companyName => _companyName;
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

class Address {
  Address({
      dynamic address, 
      dynamic city, 
      dynamic state, 
      dynamic zip, 
      String? country,}){
    _address = address;
    _city = city;
    _state = state;
    _zip = zip;
    _country = country;
}

  Address.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zip = json['zip'];
    _country = json['country'];
  }
  dynamic _address;
  dynamic _city;
  dynamic _state;
  dynamic _zip;
  String? _country;

  dynamic get address => _address;
  dynamic get city => _city;
  dynamic get state => _state;
  dynamic get zip => _zip;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zip'] = _zip;
    map['country'] = _country;
    return map;
  }

}
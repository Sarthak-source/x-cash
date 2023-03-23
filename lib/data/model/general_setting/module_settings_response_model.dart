import '../auth/sign_up_model/registration_response_model.dart';

class ModuleSettingsResponseModel {
  ModuleSettingsResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  ModuleSettingsResponseModel.fromJson(dynamic json) {
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
      ModuleSetting? moduleSetting,}){
    _moduleSetting = moduleSetting;
}

  Data.fromJson(dynamic json) {
    _moduleSetting = json['module_setting'] != null ? ModuleSetting.fromJson(json['module_setting']) : null;
  }
  ModuleSetting? _moduleSetting;

  ModuleSetting? get moduleSetting => _moduleSetting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_moduleSetting != null) {
      map['module_setting'] = _moduleSetting?.toJson();
    }
    return map;
  }

}

class ModuleSetting {
  ModuleSetting({
      List<User>? user, 
      List<Agent>? agent, 
      List<Merchant>? merchant,}){
    _user = user;
    _agent = agent;
    _merchant = merchant;
}

  ModuleSetting.fromJson(dynamic json) {
    if (json['user'] != null) {
      _user = [];
      json['user'].forEach((v) {
        _user?.add(User.fromJson(v));
      });
    }
    if (json['agent'] != null) {
      _agent = [];
      json['agent'].forEach((v) {
        _agent?.add(Agent.fromJson(v));
      });
    }
    if (json['merchant'] != null) {
      _merchant = [];
      json['merchant'].forEach((v) {
        _merchant?.add(Merchant.fromJson(v));
      });
    }
  }
  List<User>? _user;
  List<Agent>? _agent;
  List<Merchant>? _merchant;

  List<User>? get user => _user;
  List<Agent>? get agent => _agent;
  List<Merchant>? get merchant => _merchant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.map((v) => v.toJson()).toList();
    }
    if (_agent != null) {
      map['agent'] = _agent?.map((v) => v.toJson()).toList();
    }
    if (_merchant != null) {
      map['merchant'] = _merchant?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Merchant {
  Merchant({
      int? id, 
      String? userType, 
      String? slug, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userType = userType;
    _slug = slug;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Merchant.fromJson(dynamic json) {
    _id = json['id'];
    _userType = json['user_type'].toString();
    _slug = json['slug'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userType;
  String? _slug;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userType => _userType;
  String? get slug => _slug;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_type'] = _userType;
    map['slug'] = _slug;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Agent {
  Agent({
      int? id, 
      String? userType, 
      String? slug, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userType = userType;
    _slug = slug;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Agent.fromJson(dynamic json) {
    _id = json['id'];
    _userType = json['user_type'].toString();
    _slug = json['slug'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userType;
  String? _slug;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userType => _userType;
  String? get slug => _slug;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_type'] = _userType;
    map['slug'] = _slug;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class User {
  User({
      int? id, 
      String? userType, 
      String? slug, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userType = userType;
    _slug = slug;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _userType = json['user_type'].toString();
    _slug = json['slug'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userType;
  String? _slug;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userType => _userType;
  String? get slug => _slug;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_type'] = _userType;
    map['slug'] = _slug;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class PrivacyResponseModel {
  PrivacyResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  PrivacyResponseModel.fromJson(dynamic json) {
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
      List<PolicyPages>? policyPages,}){
    _policyPages = policyPages;
}

  Data.fromJson(dynamic json) {
    if (json['policy_pages'] != null) {
      _policyPages = [];
      json['policy_pages'].forEach((v) {
        _policyPages?.add(PolicyPages.fromJson(v));
      });
    }
  }
  List<PolicyPages>? _policyPages;

  List<PolicyPages>? get policyPages => _policyPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_policyPages != null) {
      map['policy_pages'] = _policyPages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PolicyPages {
  PolicyPages({
      int? id, 
      String? dataKeys, 
      DataValues? dataValues, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _dataKeys = dataKeys;
    _dataValues = dataValues;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PolicyPages.fromJson(dynamic json) {
    _id = json['id'];
    _dataKeys = json['data_keys'];
    _dataValues = json['data_values'] != null ? DataValues.fromJson(json['data_values']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _dataKeys;
  DataValues? _dataValues;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get dataKeys => _dataKeys;
  DataValues? get dataValues => _dataValues;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['data_keys'] = _dataKeys;
    if (_dataValues != null) {
      map['data_values'] = _dataValues?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class DataValues {
  DataValues({
      String? title, 
      String? details,}){
    _title = title;
    _details = details;
}

  DataValues.fromJson(dynamic json) {
    _title = json['title'];
    _details = json['details'];
  }
  String? _title;
  String? _details;

  String? get title => _title;
  String? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['details'] = _details;
    return map;
  }

}

class Message {
  Message({
      List<String>? success,}){
    _success = success;
}

  Message.fromJson(dynamic json) {
    _success = json['success'] != null ? json['success'].cast<String>() : [];
  }
  List<String>? _success;

  List<String>? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }

}
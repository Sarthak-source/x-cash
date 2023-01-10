import '../../auth/sign_up_model/registration_response_model.dart';

class DepositInsertResponseModel {
  DepositInsertResponseModel({
      String? remark, 
      String? status, 
      Message? message, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
}

  DepositInsertResponseModel.fromJson(dynamic json) {
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
      String? colorRedirectUrl,}){
    _colorRedirectUrl = colorRedirectUrl;
}

  Data.fromJson(dynamic json) {
    _colorRedirectUrl = json['colorRedirect_url'];
  }
  String? _colorRedirectUrl;

  String? get colorRedirectUrl => _colorRedirectUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['colorRedirect_url'] = _colorRedirectUrl;
    return map;
  }

}


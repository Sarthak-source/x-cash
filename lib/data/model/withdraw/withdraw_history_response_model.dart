import '../auth/sign_up_model/registration_response_model.dart';

class WithdrawHistoryResponseModel {
  WithdrawHistoryResponseModel({
    String? remark,
    String? status,
    Message? message,
    MainData? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
  }

  WithdrawHistoryResponseModel.fromJson(dynamic json) {
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
    Withdraws? withdraws,}){
    _withdraws = withdraws;
  }

  MainData.fromJson(dynamic json) {
    _withdraws = json['withdraws'] != null ? Withdraws.fromJson(json['withdraws']) : null;
  }
  Withdraws? _withdraws;

  Withdraws? get withdraws => _withdraws;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdraws != null) {
      map['withdraws'] = _withdraws?.toJson();
    }
    return map;
  }

}

class Withdraws {
  Withdraws({
    List<Data>? data,
    String? nextPageUrl,
    String? path
  }){
    _data = data;
    _nextPageUrl = nextPageUrl;
    _path = path;
  }

  Withdraws.fromJson(dynamic json) {
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
  dynamic get nextPageUrl => _nextPageUrl;
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
    String? methodId,
    String? userId,
    String? userType,
    String? amount,
    String? currencyId,
    String? walletId,
    String? currency,
    String? rate,
    String? charge,
    String? trx,
    String? finalAmount,
    String? afterCharge,
    List<WithdrawInfoModel>? withdrawInformation,
    String? status,
    dynamic adminFeedback,
    String? createdAt,
    String? updatedAt,
    Method? method,
    Curr? curr,}){
    _id = id;
    _methodId = methodId;
    _userId = userId;
    _userType = userType;
    _amount = amount;
    _currencyId = currencyId;
    _walletId = walletId;
    _currency = currency;
    _rate = rate;
    _charge = charge;
    _trx = trx;
    _finalAmount = finalAmount;
    _afterCharge = afterCharge;
    _withdrawInformation = withdrawInformation;
    _status = status;
    _adminFeedback = adminFeedback;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _method = method;
    _curr = curr;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _methodId = json['method_id'].toString();
    _userId = json['user_id'].toString();
    _userType = json['user_type'].toString();
    _amount = json['amount'].toString();
    _currencyId = json['currency_id'].toString();
    _walletId = json['wallet_id'].toString();
    _currency = json['currency'] != null ? json['currency'].toString() : "";
    _rate = json['rate'].toString();
    _charge = json['charge'].toString();
    _trx = json['trx'];
    _finalAmount = json['final_amount'] != null ? json['final_amount'].toString() : "0";
    _afterCharge = json['after_charge'].toString();
    if (json['withdraw_information'] != null) {
      _withdrawInformation = [];
      json['withdraw_information'].forEach((v) {
        _withdrawInformation?.add(WithdrawInfoModel.fromJson(v));
      });
    }
    _status = json['status'].toString();
    _adminFeedback = json['admin_feedback'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _method = json['method'] != null ? Method.fromJson(json['method']) : null;
    _curr = json['curr'] != null ? Curr.fromJson(json['curr']) : null;
  }
  int? _id;
  String? _methodId;
  String? _userId;
  String? _userType;
  String? _amount;
  String? _currencyId;
  String? _walletId;
  String? _currency;
  String? _rate;
  String? _charge;
  String? _trx;
  String? _finalAmount;
  String? _afterCharge;
  List<WithdrawInfoModel>? _withdrawInformation;
  String? _status;
  dynamic _adminFeedback;
  String? _createdAt;
  String? _updatedAt;
  Method? _method;
  Curr? _curr;

  int? get id => _id;
  String? get methodId => _methodId;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get amount => _amount;
  String? get currencyId => _currencyId;
  String? get walletId => _walletId;
  String? get currency => _currency;
  String? get rate => _rate;
  String? get charge => _charge;
  String? get trx => _trx;
  String? get finalAmount => _finalAmount;
  String? get afterCharge => _afterCharge;
  List<WithdrawInfoModel>? get withdrawInformation => _withdrawInformation;
  String? get status => _status;
  dynamic get adminFeedback => _adminFeedback;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Method? get method => _method;
  Curr? get curr => _curr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['method_id'] = _methodId;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['amount'] = _amount;
    map['currency_id'] = _currencyId;
    map['wallet_id'] = _walletId;
    map['currency'] = _currency;
    map['rate'] = _rate;
    map['charge'] = _charge;
    map['trx'] = _trx;
    map['final_amount'] = _finalAmount;
    map['after_charge'] = _afterCharge;
    map['withdraw_information'] = _withdrawInformation;
    map['status'] = _status;
    map['admin_feedback'] = _adminFeedback;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_method != null) {
      map['method'] = _method?.toJson();
    }
    if (_curr != null) {
      map['curr'] = _curr?.toJson();
    }
    return map;
  }

}

class Curr {
  Curr({
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

  Curr.fromJson(dynamic json) {
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

class Method {
  Method({
    int? id,
    String? formId,
    String? name,
    String? minLimit,
    String? maxLimit,
    String? fixedCharge,
    String? rate,
    String? percentCharge,
    dynamic currency,
    String? description,
    String? status,
    List<String>? userGuards,
    List<String>? currencies,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _formId = formId;
    _name = name;
    _minLimit = minLimit;
    _maxLimit = maxLimit;
    _fixedCharge = fixedCharge;
    _rate = rate;
    _percentCharge = percentCharge;
    _currency = currency;
    _description = description;
    _status = status;
    _userGuards = userGuards;
    _currencies = currencies;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Method.fromJson(dynamic json) {
    _id = json['id'];
    _formId = json['form_id'].toString();
    _name = json['name'];
    _minLimit = json['min_limit'] != null ? json['min_limit'].toString() : "";
    _maxLimit = json['max_limit'] != null ? json['max_limit'].toString() : "";
    _fixedCharge = json['fixed_charge'] != null ? json['fixed_charge'].toString() : "";
    _rate = json['rate'].toString();
    _percentCharge = json['percent_charge'].toString();
    _currency = json['currency'] != null ? json['currency'].toString() : "";
    _description = json['description'];
    _status = json['status'].toString();
    _userGuards = json['user_guards'] != null ? json['user_guards'].cast<String>() : [];
    _currencies = json['currencies'] != null ? json['currencies'].cast<String>() : [];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _formId;
  String? _name;
  String? _minLimit;
  String? _maxLimit;
  String? _fixedCharge;
  String? _rate;
  String? _percentCharge;
  dynamic _currency;
  String? _description;
  String? _status;
  List<String>? _userGuards;
  List<String>? _currencies;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get formId => _formId;
  String? get name => _name;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get fixedCharge => _fixedCharge;
  String? get rate => _rate;
  String? get percentCharge => _percentCharge;
  dynamic get currency => _currency;
  String? get description => _description;
  String? get status => _status;
  List<String>? get userGuards => _userGuards;
  List<String>? get currencies => _currencies;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['form_id'] = _formId;
    map['name'] = _name;
    map['min_limit'] = _minLimit;
    map['max_limit'] = _maxLimit;
    map['fixed_charge'] = _fixedCharge;
    map['rate'] = _rate;
    map['percent_charge'] = _percentCharge;
    map['currency'] = _currency;
    map['description'] = _description;
    map['status'] = _status;
    map['user_guards'] = _userGuards;
    map['currencies'] = _currencies;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class WithdrawInfo {
  WithdrawInfo({List<WithdrawInfoModel>?list}){
    _list=list;
  }

  List<WithdrawInfoModel>? _list=[];
  List<WithdrawInfoModel>? get list => _list;

  WithdrawInfo.fromJson(dynamic json) {

    json['withdraw_information'].forEach((e) {
      WithdrawInfoModel model = WithdrawInfoModel(
        name:e.value['name'],
        type:e.value['type'],
        value:(e.value['value'] as List).map((e) => e as String).toList(),
      );
      _list?.add(model);
    });


  }


}

class WithdrawInfoModel {
  WithdrawInfoModel({
    String? name,
    String? type,
    List<String>?value
  }){

    _name = name;
    _type = type;
    _value = value;
  }

  WithdrawInfoModel.fromJson(dynamic json) {
    _name = json['name'].toString();
    _type = json['type'].toString();
    String runTimeType = json['value'].runtimeType.toString();
    if(runTimeType=='String'){
      _value = [json['value'].toString()];
    } else{
      _value = json['value']!=null?(json['value'] as List).map((e) => e as String).toList():[];
    }

  }
  String? _name;
  String? _type;
  List<String>?  _value;

  String? get name => _name;
  String? get type => _type;
  List<String>? get value => _value;
}
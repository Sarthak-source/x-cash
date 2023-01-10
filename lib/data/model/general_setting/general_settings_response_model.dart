
import '../auth/sign_up_model/registration_response_model.dart';

class GeneralSettingsResponseModel {
  GeneralSettingsResponseModel({
    String? remark,
    String? status,
    Message? message,
    Data? data,}){
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
  }

  GeneralSettingsResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'].toString();
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
    GeneralSetting? generalSetting,}){
    _generalSetting = generalSetting;
  }

  Data.fromJson(dynamic json) {
    _generalSetting = json['general_setting'] != null ? GeneralSetting.fromJson(json['general_setting']) : null;
  }
  GeneralSetting? _generalSetting;

  GeneralSetting? get generalSetting => _generalSetting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_generalSetting != null) {
      map['general_setting'] = _generalSetting?.toJson();
    }
    return map;
  }

}

class GeneralSetting {
  GeneralSetting({
    int? id,
    String? siteName,
    String? curText,
    String? curSym,
    String? emailFrom,
    String? smsBody,
    String? smsFrom,
    String? baseColor,
    String? secondaryColor,
    String? forceSsl,
    String? securePassword,
    String? agree,
    String? registration,
    String? activeTemplate,
    dynamic sysVersion,
    dynamic createdAt,
    String? updatedAt,
    String? signupBonusAmount,
    String? signupBonusControl,
    String? promotionalTool,
    dynamic offDay,
    String? lastCron,
    String? bTransfer,
    String? fCharge,
    String? pCharge,   }){
    _id = id;
    _siteName = siteName;
    _curText = curText;
    _curSym = curSym;
    _emailFrom = emailFrom;
    _smsBody = smsBody;
    _smsFrom = smsFrom;
    _baseColor = baseColor;
    _secondaryColor = secondaryColor;
    _securePassword = securePassword;
    _agree = agree;
    _registration = registration;
    _activeTemplate = activeTemplate;
    _sysVersion = sysVersion;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _signupBonusAmount = signupBonusAmount;
    _signupBonusControl = signupBonusControl;
    _promotionalTool = promotionalTool;
    _offDay = offDay;
    _lastCron = lastCron;
    _bTransfer = bTransfer;
    _fCharge = fCharge;
    _pCharge = pCharge;
  }

  GeneralSetting.fromJson(dynamic json) {
    _id = json['id'];
    _siteName = json['site_name'].toString();
    _curText = json['cur_text'].toString();
    _curSym = json['cur_sym'].toString();
    _emailFrom = json['email_from'].toString();
    _smsBody = json['sms_body'].toString();
    _smsFrom = json['sms_from'].toString();
    _baseColor = json['base_color'].toString();
    _secondaryColor = json['secondary_color'].toString();
    _securePassword = json['secure_password'].toString();
    _agree = json['agree'].toString();
    _registration = json['registration'].toString();
    _activeTemplate = json['active_template'];
    _sysVersion = json['sys_version'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _signupBonusAmount = json['signup_bonus_amount'].toString();
    _signupBonusControl = json['signup_bonus_control'].toString();
    _promotionalTool = json['promotional_tool'].toString();
    _offDay = json['off_day'].toString();
    _lastCron = json['last_cron'].toString();
    _bTransfer = json['b_transfer'].toString();
    _langSwitch = json['language_switch'].toString();
    _fCharge = json['f_charge'].toString();
    _pCharge = json['p_charge'].toString();
  }
  int? _id;
  String? _siteName;
  String? _curText;
  String? _curSym;
  String? _emailFrom;
  String? _smsBody;
  String? _smsFrom;
  String? _baseColor;
  String? _secondaryColor;
  String? _securePassword;
  String? _agree;
  String? _registration;
  String? _activeTemplate;
  dynamic _sysVersion;
  dynamic _createdAt;
  String? _updatedAt;
  String? _signupBonusAmount;
  String? _signupBonusControl;
  String? _promotionalTool;
  dynamic _offDay;
  String? _lastCron;
  String? _bTransfer;
  String? _langSwitch;
  String? _fCharge;
  String? _pCharge;

  int? get id => _id;
  String? get siteName => _siteName;
  String? get curText => _curText;
  String? get curSym => _curSym;
  String? get emailFrom => _emailFrom;
  String? get smsBody => _smsBody;
  String? get smsFrom => _smsFrom;
  String? get baseColor => _baseColor;
  String? get secondaryColor => _secondaryColor;
  String? get securePassword => _securePassword;
  String? get agree => _agree;
  String? get registration => _registration;
  String? get activeTemplate => _activeTemplate;
  dynamic get sysVersion => _sysVersion;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get signupBonusAmount => _signupBonusAmount;
  String? get signupBonusControl => _signupBonusControl;
  String? get promotionalTool => _promotionalTool;
  dynamic get offDay => _offDay;
  String? get lastCron => _lastCron;
  String? get bTransfer => _bTransfer;
  String? get langSwitch => _langSwitch;
  String? get fCharge => _fCharge;
  String? get pCharge => _pCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['site_name'] = _siteName;
    map['cur_text'] = _curText;
    map['cur_sym'] = _curSym;
    map['email_from'] = _emailFrom;
    map['sms_body'] = _smsBody;
    map['sms_from'] = _smsFrom;
    map['base_color'] = _baseColor;
    map['secondary_color'] = _secondaryColor;
    map['secure_password'] = _securePassword;
    map['agree'] = _agree;
    map['registration'] = _registration;
    map['active_template'] = _activeTemplate;
    map['sys_version'] = _sysVersion;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['signup_bonus_amount'] = _signupBonusAmount;
    map['signup_bonus_control'] = _signupBonusControl;
    map['promotional_tool'] = _promotionalTool;
    map['off_day'] = _offDay;
    map['last_cron'] = _lastCron;
    map['b_transfer'] = _bTransfer;
    map['language_switch'] = _langSwitch;
    map['f_charge'] = _fCharge;
    map['p_charge'] = _pCharge;
    return map;
  }

}

class GlobalShortcodes {
  GlobalShortcodes({
    String? siteName,
    String? siteCurrency,
    String? currencySymbol,}){
    _siteName = siteName;
    _siteCurrency = siteCurrency;
    _currencySymbol = currencySymbol;
  }

  GlobalShortcodes.fromJson(dynamic json) {
    _siteName = json['site_name'].toString();
    _siteCurrency = json['site_currency'].toString();
    _currencySymbol = json['currency_symbol'].toString();
  }
  String? _siteName;
  String? _siteCurrency;
  String? _currencySymbol;

  String? get siteName => _siteName;
  String? get siteCurrency => _siteCurrency;
  String? get currencySymbol => _currencySymbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['site_name'] = _siteName;
    map['site_currency'] = _siteCurrency;
    map['currency_symbol'] = _currencySymbol;
    return map;
  }

}
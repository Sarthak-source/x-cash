class QrCodeDownloadResponseModel {
  QrCodeDownloadResponseModel({
      String? remark, 
      String? status, 
      Data? data,}){
    _remark = remark;
    _status = status;
    _data = data;
}

  QrCodeDownloadResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _remark;
  String? _status;
  Data? _data;

  String? get remark => _remark;
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = _remark;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? downloadLink, 
      String? downloadFileName,}){
    _downloadLink = downloadLink;
    _downloadFileName = downloadFileName;
}

  Data.fromJson(dynamic json) {
    _downloadLink = json['download_link'];
    _downloadFileName = json['download_file_name'];
  }
  String? _downloadLink;
  String? _downloadFileName;

  String? get downloadLink => _downloadLink;
  String? get downloadFileName => _downloadFileName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['download_link'] = _downloadLink;
    map['download_file_name'] = _downloadFileName;
    return map;
  }

}
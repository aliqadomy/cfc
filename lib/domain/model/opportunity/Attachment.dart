import 'dart:convert';
/// id : 36
/// campaign_id : 20
/// attachment : "https://admin.cfc.sa/storage/qualified/سجل الاستشارات 1447 (1).pdf"
/// ext : "pdf"
/// status : "A"

Attachment attachmentFromJson(String str) => Attachment.fromJson(json.decode(str));
String attachmentToJson(Attachment data) => json.encode(data.toJson());
class Attachment {
  Attachment({
      num? id, 
      num? campaignId, 
      String? attachment, 
      String? ext, 
      String? status,}){
    _id = id;
    _campaignId = campaignId;
    _attachment = attachment;
    _ext = ext;
    _status = status;
}

  Attachment.fromJson(dynamic json) {
    _id = json['id'];
    _campaignId = json['campaign_id'];
    _attachment = json['attachment'];
    _ext = json['ext'];
    _status = json['status'];
  }
  num? _id;
  num? _campaignId;
  String? _attachment;
  String? _ext;
  String? _status;
Attachment copyWith({  num? id,
  num? campaignId,
  String? attachment,
  String? ext,
  String? status,
}) => Attachment(  id: id ?? _id,
  campaignId: campaignId ?? _campaignId,
  attachment: attachment ?? _attachment,
  ext: ext ?? _ext,
  status: status ?? _status,
);
  num? get id => _id;
  num? get campaignId => _campaignId;
  String? get attachment => _attachment;
  String? get ext => _ext;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['campaign_id'] = _campaignId;
    map['attachment'] = _attachment;
    map['ext'] = _ext;
    map['status'] = _status;
    return map;
  }

}
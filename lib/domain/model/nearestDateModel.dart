
import 'dart:convert';

NearestDateModel nearestDateModelFromJson(String str) => NearestDateModel.fromJson(json.decode(str));
String nearestDateModelToJson(NearestDateModel data) => json.encode(data.toJson());
class NearestDateModel {
  NearestDateModel({
      num? id, 
      num? campaignId, 
      num? investerId, 
      String? date, 
      num? principle, 
      num? profit, 
      dynamic tax, 
      dynamic fees, 
      num? total, 
      num? status, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _campaignId = campaignId;
    _investerId = investerId;
    _date = date;
    _principle = principle;
    _profit = profit;
    _tax = tax;
    _fees = fees;
    _total = total;
    _status = status;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  NearestDateModel.fromJson(dynamic json) {
    _id = json['id'];
    _campaignId = json['campaign_id'];
    _investerId = json['invester_id'];
    _date = json['date'];
    _principle = json['principle'];
    _profit = json['profit'];
    _tax = json['tax'];
    _fees = json['fees'];
    _total = json['total'];
    _status = json['status'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _campaignId;
  num? _investerId;
  String? _date;
  num? _principle;
  num? _profit;
  dynamic _tax;
  dynamic _fees;
  num? _total;
  num? _status;
  String? _updatedAt;
  String? _createdAt;
NearestDateModel copyWith({  num? id,
  num? campaignId,
  num? investerId,
  String? date,
  num? principle,
  num? profit,
  dynamic tax,
  dynamic fees,
  num? total,
  num? status,
  String? updatedAt,
  String? createdAt,
}) => NearestDateModel(  id: id ?? _id,
  campaignId: campaignId ?? _campaignId,
  investerId: investerId ?? _investerId,
  date: date ?? _date,
  principle: principle ?? _principle,
  profit: profit ?? _profit,
  tax: tax ?? _tax,
  fees: fees ?? _fees,
  total: total ?? _total,
  status: status ?? _status,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get campaignId => _campaignId;
  num? get investerId => _investerId;
  String? get date => _date;
  num? get principle => _principle;
  num? get profit => _profit;
  dynamic get tax => _tax;
  dynamic get fees => _fees;
  num? get total => _total;
  num? get status => _status;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['campaign_id'] = _campaignId;
    map['invester_id'] = _investerId;
    map['date'] = _date;
    map['principle'] = _principle;
    map['profit'] = _profit;
    map['tax'] = _tax;
    map['fees'] = _fees;
    map['total'] = _total;
    map['status'] = _status;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    return map;
  }

}
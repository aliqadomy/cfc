
import '../wallet/UserKycModel.dart';

class ShowKyc {
  ShowKyc({
      this.id,
      this.title, 
      this.status, 
      this.position, 
      this.infoType,});

  ShowKyc.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    position = json['position'];
    if (json['info_type'] != null) {
      infoType = [];
      json['info_type'].forEach((v) {
        infoType?.add(InfoType.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? status;
  int? position;
  List<InfoType>? infoType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['position'] = position;
    if (infoType != null) {
      map['info_type'] = infoType?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
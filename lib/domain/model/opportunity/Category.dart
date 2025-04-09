import 'Detail.dart';

class Category {
  Category({
      this.id, 
      this.title, 
      this.minrange, 
      this.maxrange, 
      this.position, 
      this.status, 
      this.detail,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    minrange = json['minrange'];
    maxrange = json['maxrange'];
    position = json['position'];
    status = json['status'];
    if (json['detail'] != null) {
      detail = [];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  dynamic minrange;
  dynamic maxrange;
  int? position;
  int? status;
  List<Detail>? detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['minrange'] = minrange;
    map['maxrange'] = maxrange;
    map['position'] = position;
    map['status'] = status;
    if (detail != null) {
      map['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
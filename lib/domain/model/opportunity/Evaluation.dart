import 'Category.dart';

class Evaluation {
  Evaluation({
      this.id, 
      this.title, 
      this.position, 
      this.roleId, 
      this.rankType, 
      this.status, 
      this.category,});

  Evaluation.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    position = json['position'];
    roleId = json['role_id'];
    rankType = json['rank_type'];
    status = json['status'];
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  int? position;
  String? roleId;
  int? rankType;
  int? status;
  List<Category>? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['position'] = position;
    map['role_id'] = roleId;
    map['rank_type'] = rankType;
    map['status'] = status;
    if (category != null) {
      map['category'] = category!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
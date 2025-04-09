class VisitorResponse {
  VisitorResponse({
      this.id, 
      this.title, 
      this.description, 
      this.type, 
      this.status, 
      this.position,});

  VisitorResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    status = json['status'];
    position = json['position'];
  }
  int? id;
  String? title;
  String? description;
  int? type;
  int? status;
  int? position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['type'] = type;
    map['status'] = status;
    map['position'] = position;
    return map;
  }

}
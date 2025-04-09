class InfoType {
  InfoType({
      this.infoType, 
      this.title, 
      this.detail,});

  InfoType.fromJson(dynamic json) {
    infoType = json['info_type'];
    title = json['title'];
    if (json['detail'] != null) {
      detail = [];
      json['detail'].forEach((v) {
        detail?.add(json['detail'].fromJson(v));
      });
    }
  }
  int? infoType;
  String? title;
  List<dynamic>? detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['info_type'] = infoType;
    map['title'] = title;
    if (detail != null) {
      map['detail'] = detail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
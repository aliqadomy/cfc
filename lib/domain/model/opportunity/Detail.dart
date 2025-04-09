class Detail {
  Detail({
      this.id, 
      this.evpId, 
      this.evoCatId, 
      this.title, 
      this.minrange, 
      this.maxrange, 
      this.position, 
      this.status, 
      this.campEvaluationId, 
      this.value,});

  Detail.fromJson(dynamic json) {
    id = json['id'];
    evpId = json['evp_id'];
    evoCatId = json['evo_cat_id'];
    title = json['title'];
    minrange = json['minrange'];
    maxrange = json['maxrange'];
    position = json['position'];
    status = json['status'];
    campEvaluationId = json['camp_evaluation_id'];
    value = json['value'];
  }
  int? id;
  int? evpId;
  int? evoCatId;
  String? title;
  int? minrange;
  int? maxrange;
  int? position;
  int? status;
  int? campEvaluationId;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['evp_id'] = evpId;
    map['evo_cat_id'] = evoCatId;
    map['title'] = title;
    map['minrange'] = minrange;
    map['maxrange'] = maxrange;
    map['position'] = position;
    map['status'] = status;
    map['camp_evaluation_id'] = campEvaluationId;
    map['value'] = value;
    return map;
  }

}
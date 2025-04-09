class Team {
  Team({
      this.id, 
      this.name, 
      this.designation, 
      this.image,});

  Team.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? designation;
  dynamic image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['designation'] = designation;
    map['image'] = image;
    return map;
  }

}
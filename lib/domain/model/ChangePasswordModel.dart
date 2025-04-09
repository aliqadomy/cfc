class ChangePasswordModel {
  ChangePasswordModel({
      this.status, 
      this.response,});

  ChangePasswordModel.fromJson(dynamic json) {
    status = json['status'];
    response = json['response'];
  }
  bool? status;
  String? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response'] = response;
    return map;
  }

}
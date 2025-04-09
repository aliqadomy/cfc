class ModefiyKyc {
  ModefiyKyc({
      this.message, 
      this.result,});

  ModefiyKyc.fromJson(dynamic json) {
    message = json['message'];
    result = json['result'];
  }
  String? message;
  bool? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['result'] = result;
    return map;
  }

}
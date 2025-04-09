import 'Response.dart';

class LoginResponse {
  LoginResponse({
      required this.status,
      required this.response,});

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    response = json['response'] != null ? ResponseUser.fromJson(json['response']) : null;
  }
  bool? status;
  ResponseUser? response;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (response != null) {
    }
    return map;
  }

}
import 'dart:convert';
/// status : true
/// response : {"id":771,"role_type":18,"name":"ali","username":null,"email":"qadomyy@gmail.com","country_code":null,"mobile_number":"0551515517","registration_type":null,"status":1,"token":"5114|IoWh3U0x3knVcFOsWXG6y7OlPueyVlNx76wp1kOL","kyc_approved_status":null}

RegestrationModel regestrationModelFromJson(String str) => RegestrationModel.fromJson(json.decode(str));
String regestrationModelToJson(RegestrationModel data) => json.encode(data.toJson());
class RegestrationModel {
  RegestrationModel({
      bool? status, 
      ResponseRegister? response,}){
    _status = status;
    _response = response;
}

  RegestrationModel.fromJson(dynamic json) {
    _status = json['status'];
    _response = json['response'] != null ? ResponseRegister.fromJson(json['response']) : null;
  }
  bool? _status;
  ResponseRegister? _response;
RegestrationModel copyWith({  bool? status,
  ResponseRegister? response,
}) => RegestrationModel(  status: status ?? _status,
  response: response ?? _response,
);
  bool? get status => _status;
  ResponseRegister? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// id : 771
/// role_type : 18
/// name : "ali"
/// username : null
/// email : "qadomyy@gmail.com"
/// country_code : null
/// mobile_number : "0551515517"
/// registration_type : null
/// status : 1
/// token : "5114|IoWh3U0x3knVcFOsWXG6y7OlPueyVlNx76wp1kOL"
/// kyc_approved_status : null

ResponseRegister responseFromJson(String str) => ResponseRegister.fromJson(json.decode(str));
String responseToJson(ResponseRegister data) => json.encode(data.toJson());
class ResponseRegister {
  ResponseRegister({
      num? id, 
      num? roleType, 
      String? name, 
      dynamic username, 
      String? email, 
      dynamic countryCode, 
      String? mobileNumber, 
      dynamic registrationType, 
      num? status, 
      String? token, 
      dynamic kycApprovedStatus,}){
    _id = id;
    _roleType = roleType;
    _name = name;
    _username = username;
    _email = email;
    _countryCode = countryCode;
    _mobileNumber = mobileNumber;
    _registrationType = registrationType;
    _status = status;
    _token = token;
    _kycApprovedStatus = kycApprovedStatus;
}

  ResponseRegister.fromJson(dynamic json) {
    _id = json['id'];
    _roleType = json['role_type'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _countryCode = json['country_code'];
    _mobileNumber = json['mobile_number'];
    _registrationType = json['registration_type'];
    _status = json['status'];
    _token = json['token'];
    _kycApprovedStatus = json['kyc_approved_status'];
  }
  num? _id;
  num? _roleType;
  String? _name;
  dynamic _username;
  String? _email;
  dynamic _countryCode;
  String? _mobileNumber;
  dynamic _registrationType;
  num? _status;
  String? _token;
  dynamic _kycApprovedStatus;
ResponseRegister copyWith({  num? id,
  num? roleType,
  String? name,
  dynamic username,
  String? email,
  dynamic countryCode,
  String? mobileNumber,
  dynamic registrationType,
  num? status,
  String? token,
  dynamic kycApprovedStatus,
}) => ResponseRegister(  id: id ?? _id,
  roleType: roleType ?? _roleType,
  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  countryCode: countryCode ?? _countryCode,
  mobileNumber: mobileNumber ?? _mobileNumber,
  registrationType: registrationType ?? _registrationType,
  status: status ?? _status,
  token: token ?? _token,
  kycApprovedStatus: kycApprovedStatus ?? _kycApprovedStatus,
);
  num? get id => _id;
  num? get roleType => _roleType;
  String? get name => _name;
  dynamic get username => _username;
  String? get email => _email;
  dynamic get countryCode => _countryCode;
  String? get mobileNumber => _mobileNumber;
  dynamic get registrationType => _registrationType;
  num? get status => _status;
  String? get token => _token;
  dynamic get kycApprovedStatus => _kycApprovedStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['role_type'] = _roleType;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['country_code'] = _countryCode;
    map['mobile_number'] = _mobileNumber;
    map['registration_type'] = _registrationType;
    map['status'] = _status;
    map['token'] = _token;
    map['kyc_approved_status'] = _kycApprovedStatus;
    return map;
  }

}
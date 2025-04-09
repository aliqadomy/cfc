import 'dart:convert';
/// id : 173
/// name : "Ahmed Alkhateeb"
/// username : "Akhateeb"
/// department_type : null
/// department_role : null
/// role_type : 2
/// type : 1
/// cr_number_response : null
/// admin_role_id : "0"
/// kyc_approved_status : 1
/// kyc_note : null
/// mobile_number : "555555555"
/// country_code : "+966"
/// email : "khateeb.ahmed@gmail.com"
/// password : "$2y$10$MotkaX3uuKc3EQ7eLGEoCOJLLTO2J7vY9xdXSNMJtPml2xqyGqSrC"
/// is_qualified : 0

MeModel meModelFromJson(String str) => MeModel.fromJson(json.decode(str));
String meModelToJson(MeModel data) => json.encode(data.toJson());
class MeModel {
  MeModel({
      num? id, 
      String? name, 
      String? username, 
      dynamic departmentType, 
      dynamic departmentRole, 
      num? roleType, 
      num? type, 
      dynamic crNumberResponse, 
      String? adminRoleId,
      int? kycApprovedStatus,
      dynamic kycNote, 
      String? mobileNumber, 
      String? countryCode, 
      String? email, 
      String? password, 
      num? isQualified,}){
    _id = id;
    _name = name;
    _username = username;
    _departmentType = departmentType;
    _departmentRole = departmentRole;
    _roleType = roleType;
    _type = type;
    _crNumberResponse = crNumberResponse;
    _adminRoleId = adminRoleId;
    _kycApprovedStatus = kycApprovedStatus;
    _kycNote = kycNote;
    _mobileNumber = mobileNumber;
    _countryCode = countryCode;
    _email = email;
    _password = password;
    _isQualified = isQualified;
}

  MeModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _departmentType = json['department_type'];
    _departmentRole = json['department_role'];
    _roleType = json['role_type'];
    _type = json['type'];
    _crNumberResponse = json['cr_number_response'];
    _adminRoleId = json['admin_role_id'];
    _kycApprovedStatus = json['kyc_approved_status'];
    _kycNote = json['kyc_note'];
    _mobileNumber = json['mobile_number'];
    _countryCode = json['country_code'];
    _email = json['email'];
    _password = json['password'];
    _isQualified = json['is_qualified'];
  }
  num? _id;
  String? _name;
  String? _username;
  dynamic _departmentType;
  dynamic _departmentRole;
  num? _roleType;
  num? _type;
  dynamic _crNumberResponse;
  String? _adminRoleId;
  int? _kycApprovedStatus;
  dynamic _kycNote;
  String? _mobileNumber;
  String? _countryCode;
  String? _email;
  String? _password;
  num? _isQualified;
MeModel copyWith({  num? id,
  String? name,
  String? username,
  dynamic departmentType,
  dynamic departmentRole,
  num? roleType,
  num? type,
  dynamic crNumberResponse,
  String? adminRoleId,
  int? kycApprovedStatus,
  dynamic kycNote,
  String? mobileNumber,
  String? countryCode,
  String? email,
  String? password,
  num? isQualified,
}) => MeModel(  id: id ?? _id,
  name: name ?? _name,
  username: username ?? _username,
  departmentType: departmentType ?? _departmentType,
  departmentRole: departmentRole ?? _departmentRole,
  roleType: roleType ?? _roleType,
  type: type ?? _type,
  crNumberResponse: crNumberResponse ?? _crNumberResponse,
  adminRoleId: adminRoleId ?? _adminRoleId,
  kycApprovedStatus: kycApprovedStatus ?? _kycApprovedStatus,
  kycNote: kycNote ?? _kycNote,
  mobileNumber: mobileNumber ?? _mobileNumber,
  countryCode: countryCode ?? _countryCode,
  email: email ?? _email,
  password: password ?? _password,
  isQualified: isQualified ?? _isQualified,
);
  num? get id => _id;
  String? get name => _name;
  String? get username => _username;
  dynamic get departmentType => _departmentType;
  dynamic get departmentRole => _departmentRole;
  num? get roleType => _roleType;
  num? get type => _type;
  dynamic get crNumberResponse => _crNumberResponse;
  String? get adminRoleId => _adminRoleId;
  int? get kycApprovedStatus => _kycApprovedStatus;
  dynamic get kycNote => _kycNote;
  String? get mobileNumber => _mobileNumber;
  String? get countryCode => _countryCode;
  String? get email => _email;
  String? get password => _password;
  num? get isQualified => _isQualified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['department_type'] = _departmentType;
    map['department_role'] = _departmentRole;
    map['role_type'] = _roleType;
    map['type'] = _type;
    map['cr_number_response'] = _crNumberResponse;
    map['admin_role_id'] = _adminRoleId;
    map['kyc_approved_status'] = _kycApprovedStatus;
    map['kyc_note'] = _kycNote;
    map['mobile_number'] = _mobileNumber;
    map['country_code'] = _countryCode;
    map['email'] = _email;
    map['password'] = _password;
    map['is_qualified'] = _isQualified;
    return map;
  }

}
class ResponseUser {
  ResponseUser({
       this.name,
     this.username,
     this.id,
     this.kycApprovedStatus,
     this.roleType,
     this.email,
     this.registrationType,
      this.countryCode,
     this.mobileNumber,
      this.status,
      this.token,
     this.crNumberResponse,
      this.isQualified,});

  ResponseUser.fromJson(dynamic json) {
    name = json['name'];
    username = json['username']??"";
    id = json['id'];
    kycApprovedStatus = json['kyc_approved_status'];
    roleType = json['role_type'];
    email = json['email'];
    registrationType = json['registration_type'];
    countryCode = json['country_code'];
    mobileNumber = json['mobile_number'];
    status = json['status'];
    token = json['token'];
    crNumberResponse = json['cr_number_response'];
    isQualified = json['isQualified'];
  }
  String? name;
  String? username;
  String? id;
  int? kycApprovedStatus;
  int? roleType;
  String? email;
  int? registrationType;
  String? countryCode;
  String? mobileNumber;
  int? status;
  String? token;
  dynamic crNumberResponse;
  int? isQualified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['id'] = id;
    map['kyc_approved_status'] = kycApprovedStatus;
    map['role_type'] = roleType;
    map['email'] = email;
    map['registration_type'] = registrationType;
    map['country_code'] = countryCode;
    map['mobile_number'] = mobileNumber;
    map['status'] = status;
    map['token'] = token;
    map['cr_number_response'] = crNumberResponse;
    map['isQualified'] = isQualified;
    return map;
  }

}
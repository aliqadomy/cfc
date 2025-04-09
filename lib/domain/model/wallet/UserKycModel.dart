class UserKycModel {
  final int? id;
  final String? title;
  final String? status;
  final int? position;
  final List<InfoType>? infoType;

  UserKycModel({
    this.id,
    this.title,
    this.status,
    this.position,
    this.infoType,
  });

  factory UserKycModel.fromJson(Map<String, dynamic> json) {
    return UserKycModel(
      id: json['id'] != null
          ? (json['id'] is int ? json['id'] : int.tryParse(json['id'].toString())!)
          : null,
      title: json['title'] as String?,
      status: json['status'] != null
          ? (json['status'] is String ? json['status'] : json['status'].toString())
          : null,
      position: json['position'] != null
          ? (json['position'] is int
          ? json['position']
          : int.tryParse(json['position'].toString())!)
          : null,
      infoType: (json['info_type'] as List?)
          ?.map((info) => InfoType.fromJson(info))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
      'position': position,
      'info_type': infoType?.map((info) => info.toJson()).toList(),
    };
  }
}

class InfoType {
  final int? infoType;
  final String? title;
  final List<Detail>? detail;

  InfoType({
    this.infoType,
    this.title,
    this.detail,
  });

  factory InfoType.fromJson(Map<String, dynamic> json) {
    return InfoType(
      infoType: json['info_type'] != null
          ? (json['info_type'] is int
          ? json['info_type']
          : int.tryParse(json['info_type'].toString())!)
          : null,
      title: json['title'] as String?,
      detail: (json['detail'] as List?)
          ?.map((d) => Detail.fromJson(d))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info_type': infoType,
      'title': title,
      'detail': detail?.map((d) => d.toJson()).toList(),
    };
  }
}

class Detail {
  final int? id;
  final String? kycId;
  final int? type;
  final int? infoType;
  final String? title;
  final String? length;
  final int? mandatory;
  final String? status;
  final int? position;
  final int? userKycId;
  final String? value;

  Detail({
    this.id,
    this.kycId,
    this.type,
    this.infoType,
    this.title,
    this.length,
    this.mandatory,
    this.status,
    this.position,
    this.userKycId,
    this.value,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['id'] != null
          ? (json['id'] is int ? json['id'] : int.tryParse(json['id'].toString())!)
          : null,
      kycId: json['kyc_id'] != null
          ? (json['kyc_id'] is String ? json['kyc_id'] : json['kyc_id'].toString())
          : null,
      type: json['type'] != null
          ? (json['type'] is int ? json['type'] : int.tryParse(json['type'].toString())!)
          : null,
      infoType: json['info_type'] != null
          ? (json['info_type'] is int ? json['info_type'] : int.tryParse(json['info_type'].toString())!)
          : null,
      title: json['title'] as String?,
      length: json['length'] != null
          ? (json['length'] is String ? json['length'] : json['length'].toString())
          : null,
      mandatory: json['mandatory'] != null
          ? (json['mandatory'] is int
          ? json['mandatory']
          : int.tryParse(json['mandatory'].toString())!)
          : null,
      status: json['status'] != null
          ? (json['status'] is String ? json['status'] : json['status'].toString())
          : null,
      position: json['position'] != null
          ? (json['position'] is int
          ? json['position']
          : int.tryParse(json['position'].toString())!)
          : null,
      userKycId: json['user_kyc_id'] != null
          ? (json['user_kyc_id'] is int
          ? json['user_kyc_id']
          : int.tryParse(json['user_kyc_id'].toString())!)
          : null,
      value: json['value'] != null
          ? (json['value'] is String ? json['value'] : json['value'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyc_id': kycId,
      'type': type,
      'info_type': infoType,
      'title': title,
      'length': length,
      'mandatory': mandatory,
      'status': status,
      'position': position,
      'user_kyc_id': userKycId,
      'value': value,
    };
  }
}

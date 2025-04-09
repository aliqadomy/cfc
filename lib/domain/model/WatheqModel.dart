import 'PersonIdInfo.dart';
import 'PersonBasicInfo.dart';

class WatheqModel {
  WatheqModel({
      this.personIdInfo, 
      this.personBasicInfo,});

  WatheqModel.fromJson(dynamic json) {
    personIdInfo = json['personIdInfo'] != null ? PersonIdInfo.fromJson(json['personIdInfo']) : null;
    personBasicInfo = json['personBasicInfo'] != null ? PersonBasicInfo.fromJson(json['personBasicInfo']) : null;
  }
  PersonIdInfo? personIdInfo;
  PersonBasicInfo? personBasicInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (personIdInfo != null) {
      map['personIdInfo'] = personIdInfo?.toJson();
    }
    if (personBasicInfo != null) {
      map['personBasicInfo'] = personBasicInfo?.toJson();
    }
    return map;
  }

}
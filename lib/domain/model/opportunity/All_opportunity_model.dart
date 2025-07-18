import 'CloseDate.dart';
import 'OpenDate.dart';
import 'CommingSoon.dart';
import 'MyOpportunity.dart';

class AllOpportunityModel {
  AllOpportunityModel({
      this.closeDate, 
      this.openDate, 
      this.commingSoon, 
      this.myOpportunity,});

  AllOpportunityModel.fromJson(dynamic json) {
    if (json['close_date'] != null) {
      closeDate = [];
      json['close_date'].forEach((v) {
        closeDate?.add(CloseDate.fromJson(v));
      });
    }
    if (json['open_date'] != null) {
      openDate = [];
      json['open_date'].forEach((v) {
        openDate?.add(OpenDate.fromJson(v));
      });
    }
    if (json['comming_soon'] != null) {
      commingSoon = [];
      json['comming_soon'].forEach((v) {
        commingSoon?.add(CommingSoon.fromJson(v));
      });
    }
    if (json['myOpportunity'] != null) {
      myOpportunity = [];
      json['myOpportunity'].forEach((v) {
        myOpportunity?.add(MyOpportunity.fromJson(v));
      });
    }
  }
  List<CloseDate>? closeDate;
  List<OpenDate>? openDate;
  List<CommingSoon>? commingSoon;
  List<MyOpportunity>? myOpportunity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (closeDate != null) {
      map['close_date'] = closeDate?.map((v) => v.toJson()).toList();
    }
    if (openDate != null) {
      map['open_date'] = openDate?.map((v) => v.toJson()).toList();
    }
    if (commingSoon != null) {
      map['comming_soon'] = commingSoon?.map((v) => v.toJson()).toList();
    }
    if (myOpportunity != null) {
      map['myOpportunity'] = myOpportunity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class AccountNumberModel {
  AccountNumberModel({
      this.id, 
      this.userId, 
      this.opportunityId, 
      this.type, 
      this.accountNumber, 
      this.createdAt, 
      this.createdBy,});

  AccountNumberModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    opportunityId = json['opportunity_id'];
    type = json['type'];
    accountNumber = json['account_number'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
  }
  int? id;
  String? userId;
  int? opportunityId;
  int? type;
  String? accountNumber;
  String? createdAt;
  int? createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['opportunity_id'] = opportunityId;
    map['type'] = type;
    map['account_number'] = accountNumber;
    map['created_at'] = createdAt;
    map['created_by'] = createdBy;
    return map;
  }

}
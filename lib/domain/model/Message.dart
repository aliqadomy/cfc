class Message {
  Message({
      this.id, 
      this.campaignId, 
      this.investerId, 
      this.date, 
      this.principle, 
      this.profit, 
      this.tax, 
      this.fees, 
      this.total, 
      this.updatedAt, 
      this.createdAt,});

  Message.fromJson(dynamic json) {
    id = json['id'];
    campaignId = json['campaign_id'];
    investerId = json['invester_id'];
    date = json['date'];
    principle = json['principle'];
    profit = json['profit'];
    tax = json['tax'];
    fees = json['fees'];
    total = json['total'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
  int? id;
  int? campaignId;
  int? investerId;
  String? date;
  double? principle;
  int? profit;
  dynamic tax;
  dynamic fees;
  double? total;
  String? updatedAt;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['campaign_id'] = campaignId;
    map['invester_id'] = investerId;
    map['date'] = date;
    map['principle'] = principle;
    map['profit'] = profit;
    map['tax'] = tax;
    map['fees'] = fees;
    map['total'] = total;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }

}
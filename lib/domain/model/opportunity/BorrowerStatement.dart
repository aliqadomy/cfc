class BorrowerStatement {
  BorrowerStatement({
      this.id, 
      this.campaignId, 
      this.dueDate, 
      this.principleExpected, 
      this.interestExpected, 
      this.feesExpected, 
      this.totalExpected, 
      this.principlePaid, 
      this.interestPaid, 
      this.feesPaid, 
      this.totalPaid, 
      this.paidDate, 
      this.principleDue, 
      this.interestDue, 
      this.feesDue, 
      this.totalDue, 
      this.status,});

  BorrowerStatement.fromJson(dynamic json) {
    id = json['id'];
    campaignId = json['campaign_id'];
    dueDate = json['due_date'];
    principleExpected = json['principle_expected'];
    interestExpected = json['interest_expected'];
    feesExpected = json['fees_expected'];
    totalExpected = json['total_expected'];
    principlePaid = json['principle_paid'];
    interestPaid = json['interest_paid'];
    feesPaid = json['fees_paid'];
    totalPaid = json['total_paid'];
    paidDate = json['paid_date'];
    principleDue = json['principle_due'];
    interestDue = json['interest_due'];
    feesDue = json['fees_due'];
    totalDue = json['total_due'];
    status = json['status'];
  }
  int? id;
  int? campaignId;
  String? dueDate;
  double? principleExpected;
  double? interestExpected;
  int? feesExpected;
  double? totalExpected;
  dynamic principlePaid;
  dynamic interestPaid;
  dynamic feesPaid;
  dynamic totalPaid;
  dynamic paidDate;
  dynamic principleDue;
  dynamic interestDue;
  dynamic feesDue;
  dynamic totalDue;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['campaign_id'] = campaignId;
    map['due_date'] = dueDate;
    map['principle_expected'] = principleExpected;
    map['interest_expected'] = interestExpected;
    map['fees_expected'] = feesExpected;
    map['total_expected'] = totalExpected;
    map['principle_paid'] = principlePaid;
    map['interest_paid'] = interestPaid;
    map['fees_paid'] = feesPaid;
    map['total_paid'] = totalPaid;
    map['paid_date'] = paidDate;
    map['principle_due'] = principleDue;
    map['interest_due'] = interestDue;
    map['fees_due'] = feesDue;
    map['total_due'] = totalDue;
    map['status'] = status;
    return map;
  }

}
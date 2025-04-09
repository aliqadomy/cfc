import 'dart:convert';
/// id : "38badf62-a523-43be-aa90-c1c825950784"
/// sequenceNumber : "202024273"
/// transactionReferenceNumber : "BT15051632"
/// externalReferenceNumber : "20241222SAARNBARNB1B21812107948756"
/// status : "PROCESSED"
/// transactionComment : "ANB to INMASARI works"
/// createdAt : "2024-12-22T18:07:40.747Z"
/// updatedAt : "2024-12-22T18:07:42.388Z"

WithDrawBalance withDrawBalanceFromJson(String str) => WithDrawBalance.fromJson(json.decode(str));
String withDrawBalanceToJson(WithDrawBalance data) => json.encode(data.toJson());
class WithDrawBalance {
  WithDrawBalance({
      String? id, 
      String? sequenceNumber, 
      String? transactionReferenceNumber, 
      String? externalReferenceNumber, 
      String? status, 
      String? transactionComment, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _sequenceNumber = sequenceNumber;
    _transactionReferenceNumber = transactionReferenceNumber;
    _externalReferenceNumber = externalReferenceNumber;
    _status = status;
    _transactionComment = transactionComment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WithDrawBalance.fromJson(dynamic json) {
    _id = json['id'];
    _sequenceNumber = json['sequenceNumber'];
    _transactionReferenceNumber = json['transactionReferenceNumber'];
    _externalReferenceNumber = json['externalReferenceNumber'];
    _status = json['status'];
    _transactionComment = json['transactionComment'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _sequenceNumber;
  String? _transactionReferenceNumber;
  String? _externalReferenceNumber;
  String? _status;
  String? _transactionComment;
  String? _createdAt;
  String? _updatedAt;
WithDrawBalance copyWith({  String? id,
  String? sequenceNumber,
  String? transactionReferenceNumber,
  String? externalReferenceNumber,
  String? status,
  String? transactionComment,
  String? createdAt,
  String? updatedAt,
}) => WithDrawBalance(  id: id ?? _id,
  sequenceNumber: sequenceNumber ?? _sequenceNumber,
  transactionReferenceNumber: transactionReferenceNumber ?? _transactionReferenceNumber,
  externalReferenceNumber: externalReferenceNumber ?? _externalReferenceNumber,
  status: status ?? _status,
  transactionComment: transactionComment ?? _transactionComment,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get sequenceNumber => _sequenceNumber;
  String? get transactionReferenceNumber => _transactionReferenceNumber;
  String? get externalReferenceNumber => _externalReferenceNumber;
  String? get status => _status;
  String? get transactionComment => _transactionComment;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sequenceNumber'] = _sequenceNumber;
    map['transactionReferenceNumber'] = _transactionReferenceNumber;
    map['externalReferenceNumber'] = _externalReferenceNumber;
    map['status'] = _status;
    map['transactionComment'] = _transactionComment;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}
import 'dart:convert';
/// data : {"wallet_data":[{"id":45,"investor_id":173,"opportunity_id":0,"refNum":"SDC230521","investor_statement_id":null,"type":1,"wallet_before":0,"debit_amount":0,"credit_amount":1000,"wallet_after":1000,"created_by":0,"created_at":"2024-01-31 13:42:27"}],"campgain_name":[]}

FinicialStatmentModel finicialStatmentModelFromJson(String str) => FinicialStatmentModel.fromJson(json.decode(str));
String finicialStatmentModelToJson(FinicialStatmentModel data) => json.encode(data.toJson());
class FinicialStatmentModel {
  FinicialStatmentModel({
      Data? data,}){
    _data = data;
}

  FinicialStatmentModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
FinicialStatmentModel copyWith({  Data? data,
}) => FinicialStatmentModel(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}



Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<WalletData>? walletData, 
      List<dynamic>? campgainName,}){
    _walletData = walletData;
    _campgainName = campgainName;
}

  Data.fromJson(dynamic json) {
    if (json['wallet_data'] != null) {
      _walletData = [];
      json['wallet_data'].forEach((v) {
        _walletData?.add(WalletData.fromJson(v));
      });
    }
    if (json['campgain_name'] != null) {
      _campgainName = [];
      json['campgain_name'].forEach((v) {
        _campgainName?.add(json['campgain_name'].fromJson(v));
      });
    }
  }
  List<WalletData>? _walletData;
  List<dynamic>? _campgainName;
Data copyWith({  List<WalletData>? walletData,
  List<dynamic>? campgainName,
}) => Data(  walletData: walletData ?? _walletData,
  campgainName: campgainName ?? _campgainName,
);
  List<WalletData>? get walletData => _walletData;
  List<dynamic>? get campgainName => _campgainName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_walletData != null) {
      map['wallet_data'] = _walletData?.map((v) => v.toJson()).toList();
    }
    if (_campgainName != null) {
      map['campgain_name'] = _campgainName?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 45
/// investor_id : 173
/// opportunity_id : 0
/// refNum : "SDC230521"
/// investor_statement_id : null
/// type : 1
/// wallet_before : 0
/// debit_amount : 0
/// credit_amount : 1000
/// wallet_after : 1000
/// created_by : 0
/// created_at : "2024-01-31 13:42:27"

WalletData walletDataFromJson(String str) => WalletData.fromJson(json.decode(str));
String walletDataToJson(WalletData data) => json.encode(data.toJson());
class WalletData {
  WalletData({
      num? id, 
      num? investorId, 
      num? opportunityId, 
      String? refNum, 
      dynamic investorStatementId, 
      num? type, 
      num? walletBefore, 
      num? debitAmount, 
      num? creditAmount, 
      num? walletAfter, 
      num? createdBy, 
      String? createdAt,}){
    _id = id;
    _investorId = investorId;
    _opportunityId = opportunityId;
    _refNum = refNum;
    _investorStatementId = investorStatementId;
    _type = type;
    _walletBefore = walletBefore;
    _debitAmount = debitAmount;
    _creditAmount = creditAmount;
    _walletAfter = walletAfter;
    _createdBy = createdBy;
    _createdAt = createdAt;
}

  WalletData.fromJson(dynamic json) {
    _id = json['id'];
    _investorId = json['investor_id'];
    _opportunityId = json['opportunity_id'];
    _refNum = json['refNum'];
    _investorStatementId = json['investor_statement_id'];
    _type = json['type'];
    _walletBefore = json['wallet_before'];
    _debitAmount = json['debit_amount'];
    _creditAmount = json['credit_amount'];
    _walletAfter = json['wallet_after'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _investorId;
  num? _opportunityId;
  String? _refNum;
  dynamic _investorStatementId;
  num? _type;
  num? _walletBefore;
  num? _debitAmount;
  num? _creditAmount;
  num? _walletAfter;
  num? _createdBy;
  String? _createdAt;
WalletData copyWith({  num? id,
  num? investorId,
  num? opportunityId,
  String? refNum,
  dynamic investorStatementId,
  num? type,
  num? walletBefore,
  num? debitAmount,
  num? creditAmount,
  num? walletAfter,
  num? createdBy,
  String? createdAt,
}) => WalletData(  id: id ?? _id,
  investorId: investorId ?? _investorId,
  opportunityId: opportunityId ?? _opportunityId,
  refNum: refNum ?? _refNum,
  investorStatementId: investorStatementId ?? _investorStatementId,
  type: type ?? _type,
  walletBefore: walletBefore ?? _walletBefore,
  debitAmount: debitAmount ?? _debitAmount,
  creditAmount: creditAmount ?? _creditAmount,
  walletAfter: walletAfter ?? _walletAfter,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  num? get investorId => _investorId;
  num? get opportunityId => _opportunityId;
  String? get refNum => _refNum;
  dynamic get investorStatementId => _investorStatementId;
  num? get type => _type;
  num? get walletBefore => _walletBefore;
  num? get debitAmount => _debitAmount;
  num? get creditAmount => _creditAmount;
  num? get walletAfter => _walletAfter;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['investor_id'] = _investorId;
    map['opportunity_id'] = _opportunityId;
    map['refNum'] = _refNum;
    map['investor_statement_id'] = _investorStatementId;
    map['type'] = _type;
    map['wallet_before'] = _walletBefore;
    map['debit_amount'] = _debitAmount;
    map['credit_amount'] = _creditAmount;
    map['wallet_after'] = _walletAfter;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    return map;
  }

}
import 'dart:convert';
/// debit : 0
/// credit : 5051.5999755859375
/// walletBalance : 1000

WalletResponseModel walletResponseModelFromJson(String str) => WalletResponseModel.fromJson(json.decode(str));
String walletResponseModelToJson(WalletResponseModel data) => json.encode(data.toJson());
class WalletResponseModel {
  WalletResponseModel({
      num? debit, 
      num? credit, 
      num? walletBalance,}){
    _debit = debit;
    _credit = credit;
    _walletBalance = walletBalance;
}

  WalletResponseModel.fromJson(dynamic json) {
    _debit = json['debit'];
    _credit = json['credit'];
    _walletBalance = json['walletBalance'];
  }
  num? _debit;
  num? _credit;
  num? _walletBalance;
WalletResponseModel copyWith({  num? debit,
  num? credit,
  num? walletBalance,
}) => WalletResponseModel(  debit: debit ?? _debit,
  credit: credit ?? _credit,
  walletBalance: walletBalance ?? _walletBalance,
);
  num? get debit => _debit;
  num? get credit => _credit;
  num? get walletBalance => _walletBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['debit'] = _debit;
    map['credit'] = _credit;
    map['walletBalance'] = _walletBalance;
    return map;
  }

}
import 'dart:convert';
/// investor_id : "eyJpdiI6ImdSY3lDdWN3T2xxbndpZWp2eFFQbUE9PSIsInZhbHVlIjoibDhsNndMVTMyWGhuYmFBTGwvV1dSZz09IiwibWFjIjoiZWM3OGNlMTUzNmFjMDg2MDJiYzNkODU2YzI0YzIxODI1N2U2MTgxYWExNmM4ODExMjk3YjZlZmZiMzdmODRmZSIsInRhZyI6IiJ9"
/// number_of_investment : 1
/// total_investment : 1000
/// total_profit : 0

InvestorDashBoardModel investorDashBoardFromJson(String str) => InvestorDashBoardModel.fromJson(json.decode(str));
String investorDashBoardToJson(InvestorDashBoardModel data) => json.encode(data.toJson());
class InvestorDashBoardModel {
  InvestorDashBoardModel({
      String? investorId, 
      num? numberOfInvestment,
      num? totalInvestment,
      num? totalProfit,}){
    _investorId = investorId;
    _numberOfInvestment = numberOfInvestment;
    _totalInvestment = totalInvestment;
    _totalProfit = totalProfit;
}

  InvestorDashBoardModel.fromJson(dynamic json) {
    _investorId = json['investor_id'];
    _numberOfInvestment = json['number_of_investment'];
    _totalInvestment = json['total_investment'];
    _totalProfit = json['total_profit'];
  }
  String? _investorId;
  num? _numberOfInvestment;
  num? _totalInvestment;
  num? _totalProfit;
InvestorDashBoardModel copyWith({  String? investorId,
  num? numberOfInvestment,
  num? totalInvestment,
  num? totalProfit,
}) => InvestorDashBoardModel(  investorId: investorId ?? _investorId,
  numberOfInvestment: numberOfInvestment ?? _numberOfInvestment,
  totalInvestment: totalInvestment ?? _totalInvestment,
  totalProfit: totalProfit ?? _totalProfit,
);
  String? get investorId => _investorId;
  num? get numberOfInvestment => _numberOfInvestment;
  num? get totalInvestment => _totalInvestment;
  num? get totalProfit => _totalProfit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['investor_id'] = _investorId;
    map['number_of_investment'] = _numberOfInvestment;
    map['total_investment'] = _totalInvestment;
    map['total_profit'] = _totalProfit;
    return map;
  }

}
class TotalCampaginInvestmentById {
  TotalCampaginInvestmentById({
    this.totalInvestment,
  });

  TotalCampaginInvestmentById.fromJson(dynamic json) {
    final value = json['total_investment'];
    totalInvestment = (value is int)
        ? value.toDouble()
        : (value is double)
        ? value
        : null;
  }

  double? totalInvestment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_investment'] = totalInvestment;
    return map;
  }
}

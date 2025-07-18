class CommingSoon {
  CommingSoon({
      this.id, 
      this.userId, 
      this.productId, 
      this.approvedStatus, 
      this.approveLoan, 
      this.note, 
      this.tagline, 
      this.sharePrice, 
      this.totalValuation, 
      this.minInvestment, 
      this.maxInvestment, 
      this.closeDate, 
      this.fundriserInvestment, 
      this.durationId, 
      this.returnsTypeId, 
      this.companyBio, 
      this.reasonToInvest, 
      this.investmentPlanning, 
      this.terms, 
      this.introduceTeam, 
      this.status, 
      this.createdBy, 
      this.createdAt, 
      this.updatedBy, 
      this.updatedAt, 
      this.programNumber, 
      this.versionNumber, 
      this.openDate, 
      this.netSales, 
      this.netSalesYears, 
      this.netProfit, 
      this.netProfitYears, 
      this.cashFlow, 
      this.returnOnAssets, 
      this.debtOfAssets, 
      this.finStatementYear, 
      this.dueDate, 
      this.apr, 
      this.infoStatementDateG, 
      this.infoStatementDateH, 
      this.financingType, 
      this.fundUse, 
      this.financingPeriod, 
      this.obtainFinanceDt, 
      this.financeRepaymentDt, 
      this.investmentStatus,});

  CommingSoon.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    approvedStatus = json['approved_status'];
    approveLoan = json['approve_loan'];
    note = json['note'];
    tagline = json['tagline'];
    sharePrice = json['share_price'];
    totalValuation = json['total_valuation'];
    minInvestment = json['min_investment'];
    maxInvestment = json['max_investment'];
    closeDate = json['close_date'];
    fundriserInvestment = json['fundriser_investment'];
    durationId = json['duration_id'];
    returnsTypeId = json['returns_type_id'];
    companyBio = json['company_bio'];
    reasonToInvest = json['reason_to_invest'];
    investmentPlanning = json['investment_planning'];
    terms = json['terms'];
    introduceTeam = json['introduce_team'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    programNumber = json['program_number'];
    versionNumber = json['version_number'];
    openDate = json['open_date'];
    netSales = json['net_sales'];
    netSalesYears = json['net_sales_years'];
    netProfit = json['net_profit'];
    netProfitYears = json['net_profit_years'];
    cashFlow = json['cash_flow'];
    returnOnAssets = json['return_on_assets'];
    debtOfAssets = json['debt_of_assets'];
    finStatementYear = json['fin_statement_year'];
    dueDate = json['due_date'];
    apr = json['APR'];
    infoStatementDateG = json['info_Statement_date_G'];
    infoStatementDateH = json['info_Statement_date_h'];
    financingType = json['financing_type'];
    fundUse = json['fund_use'];
    financingPeriod = json['financing_period'];
    obtainFinanceDt = json['obtain_finance_dt'];
    financeRepaymentDt = json['finance_repayment_dt'];
    investmentStatus = json['investment_status'];
  }
  int? id;
  int? userId;
  int? productId;
  int? approvedStatus;
  dynamic approveLoan;
  dynamic note;
  String? tagline;
  dynamic sharePrice;
  dynamic totalValuation;
  dynamic minInvestment;
  dynamic maxInvestment;
  String? closeDate;
  dynamic fundriserInvestment;
  int? durationId;
  int? returnsTypeId;
  String? companyBio;
  String? reasonToInvest;
  String? investmentPlanning;
  String? terms;
  int? introduceTeam;
  int? status;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  String? programNumber;
  int? versionNumber;
  String? openDate;
  String? netSales;
  String? netSalesYears;
  String? netProfit;
  dynamic netProfitYears;
  dynamic cashFlow;
  dynamic returnOnAssets;
  dynamic debtOfAssets;
  String? finStatementYear;
  String? dueDate;
  dynamic apr;
  String? infoStatementDateG;
  String? infoStatementDateH;
  String? financingType;
  String? fundUse;
  String? financingPeriod;
  String? obtainFinanceDt;
  String? financeRepaymentDt;
  String? investmentStatus;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['product_id'] = productId;
    map['approved_status'] = approvedStatus;
    map['approve_loan'] = approveLoan;
    map['note'] = note;
    map['tagline'] = tagline;
    map['share_price'] = sharePrice;
    map['total_valuation'] = totalValuation;
    map['min_investment'] = minInvestment;
    map['max_investment'] = maxInvestment;
    map['close_date'] = closeDate;
    map['fundriser_investment'] = fundriserInvestment;
    map['duration_id'] = durationId;
    map['returns_type_id'] = returnsTypeId;
    map['company_bio'] = companyBio;
    map['reason_to_invest'] = reasonToInvest;
    map['investment_planning'] = investmentPlanning;
    map['terms'] = terms;
    map['introduce_team'] = introduceTeam;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['created_at'] = createdAt;
    map['updated_by'] = updatedBy;
    map['updated_at'] = updatedAt;
    map['program_number'] = programNumber;
    map['version_number'] = versionNumber;
    map['open_date'] = openDate;
    map['net_sales'] = netSales;
    map['net_sales_years'] = netSalesYears;
    map['net_profit'] = netProfit;
    map['net_profit_years'] = netProfitYears;
    map['cash_flow'] = cashFlow;
    map['return_on_assets'] = returnOnAssets;
    map['debt_of_assets'] = debtOfAssets;
    map['fin_statement_year'] = finStatementYear;
    map['due_date'] = dueDate;
    map['APR'] = apr;
    map['info_Statement_date_G'] = infoStatementDateG;
    map['info_Statement_date_h'] = infoStatementDateH;
    map['financing_type'] = financingType;
    map['fund_use'] = fundUse;
    map['financing_period'] = financingPeriod;
    map['obtain_finance_dt'] = obtainFinanceDt;
    map['finance_repayment_dt'] = financeRepaymentDt;
    map['investment_status'] = investmentStatus;
    return map;
  }

}
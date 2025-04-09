import 'dart:convert';

AllOpportunityModel allOpportunityModelFromJson(String str) => AllOpportunityModel.fromJson(json.decode(str));
String allOpportunityModelToJson(AllOpportunityModel data) => json.encode(data.toJson());
class AllOpportunityModel {
  AllOpportunityModel({
      List<CloseDate>? closeDate,
      List<OpenDate>? openDate,
      List<CommingSoon>? commingSoon,
      List<MyOpportunity>? myOpportunity,}){
    _closeDate = closeDate;
    _openDate = openDate;
    _commingSoon = commingSoon;
    _myOpportunity = myOpportunity;
}

  AllOpportunityModel.fromJson(dynamic json) {
    if (json['close_date'] != null) {
      _closeDate = [];
      json['close_date'].forEach((v) {
        _closeDate?.add(CloseDate.fromJson(v));
      });
    }
    if (json['open_date'] != null) {
      _openDate = [];
      json['open_date'].forEach((v) {
        _openDate?.add(OpenDate.fromJson(v));
      });
    }
    if (json['comming_soon'] != null) {
      _commingSoon = [];
      json['comming_soon'].forEach((v) {
        _commingSoon?.add(CommingSoon.fromJson(v));
      });
    }
    if (json['myOpportunity'] != null) {
      _myOpportunity = [];
      json['myOpportunity'].forEach((v) {
        _myOpportunity?.add(MyOpportunity.fromJson(v));
      });
    }
  }
  List<CloseDate>? _closeDate;
  List<OpenDate>? _openDate;
  List<CommingSoon>? _commingSoon;
  List<MyOpportunity>? _myOpportunity;
AllOpportunityModel copyWith({  List<CloseDate>? closeDate,
  List<OpenDate>? openDate,
  List<CommingSoon>? commingSoon,
  List<MyOpportunity>? myOpportunity,
}) => AllOpportunityModel(  closeDate: closeDate ?? _closeDate,
  openDate: openDate ?? _openDate,
  commingSoon: commingSoon ?? _commingSoon,
  myOpportunity: myOpportunity ?? _myOpportunity,
);
  List<CloseDate>? get closeDate => _closeDate;
  List<OpenDate>? get openDate => _openDate;
  List<CommingSoon>? get commingSoon => _commingSoon;
  List<MyOpportunity>? get myOpportunity => _myOpportunity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_closeDate != null) {
      map['close_date'] = _closeDate?.map((v) => v.toJson()).toList();
    }
    if (_openDate != null) {
      map['open_date'] = _openDate?.map((v) => v.toJson()).toList();
    }
    if (_commingSoon != null) {
      map['comming_soon'] = _commingSoon?.map((v) => v.toJson()).toList();
    }
    if (_myOpportunity != null) {
      map['myOpportunity'] = _myOpportunity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



MyOpportunity myOpportunityFromJson(String str) => MyOpportunity.fromJson(json.decode(str));
String myOpportunityToJson(MyOpportunity data) => json.encode(data.toJson());
class MyOpportunity {
  MyOpportunity({
      num? id, 
      num? userId, 
      num? productId, 
      num? approvedStatus, 
      dynamic approveLoan, 
      dynamic note, 
      String? tagline, 
      num? sharePrice, 
      num? totalValuation, 
      num? minInvestment, 
      num? maxInvestment, 
      String? closeDate, 
      dynamic fundriserInvestment, 
      num? durationId, 
      num? returnsTypeId, 
      String? companyBio, 
      String? reasonToInvest, 
      String? investmentPlanning, 
      String? terms, 
      num? introduceTeam, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      String? programNumber, 
      num? versionNumber, 
      String? openDate, 
      num? netSales, 
      String? netSalesYears, 
      num? netProfit, 
      dynamic netProfitYears, 
      num? cashFlow, 
      num? returnOnAssets, 
      num? debtOfAssets, 
      String? finStatementYear, 
      String? dueDate, 
      num? apr, 
      String? infoStatementDateG, 
      String? infoStatementDateH, 
      String? financingType, 
      String? fundUse, 
      String? financingPeriod, 
      String? obtainFinanceDt, 
      String? financeRepaymentDt, 
      String? investmentStatus,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _approvedStatus = approvedStatus;
    _approveLoan = approveLoan;
    _note = note;
    _tagline = tagline;
    _sharePrice = sharePrice;
    _totalValuation = totalValuation;
    _minInvestment = minInvestment;
    _maxInvestment = maxInvestment;
    _closeDate = closeDate;
    _fundriserInvestment = fundriserInvestment;
    _durationId = durationId;
    _returnsTypeId = returnsTypeId;
    _companyBio = companyBio;
    _reasonToInvest = reasonToInvest;
    _investmentPlanning = investmentPlanning;
    _terms = terms;
    _introduceTeam = introduceTeam;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _programNumber = programNumber;
    _versionNumber = versionNumber;
    _openDate = openDate;
    _netSales = netSales;
    _netSalesYears = netSalesYears;
    _netProfit = netProfit;
    _netProfitYears = netProfitYears;
    _cashFlow = cashFlow;
    _returnOnAssets = returnOnAssets;
    _debtOfAssets = debtOfAssets;
    _finStatementYear = finStatementYear;
    _dueDate = dueDate;
    _apr = apr;
    _infoStatementDateG = infoStatementDateG;
    _infoStatementDateH = infoStatementDateH;
    _financingType = financingType;
    _fundUse = fundUse;
    _financingPeriod = financingPeriod;
    _obtainFinanceDt = obtainFinanceDt;
    _financeRepaymentDt = financeRepaymentDt;
    _investmentStatus = investmentStatus;
}

  MyOpportunity.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _approvedStatus = json['approved_status'];
    _approveLoan = json['approve_loan'];
    _note = json['note'];
    _tagline = json['tagline'];
    _sharePrice = json['share_price'];
    _totalValuation = json['total_valuation'];
    _minInvestment = json['min_investment'];
    _maxInvestment = json['max_investment'];
    _closeDate = json['close_date'];
    _fundriserInvestment = json['fundriser_investment'];
    _durationId = json['duration_id'];
    _returnsTypeId = json['returns_type_id'];
    _companyBio = json['company_bio'];
    _reasonToInvest = json['reason_to_invest'];
    _investmentPlanning = json['investment_planning'];
    _terms = json['terms'];
    _introduceTeam = json['introduce_team'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _programNumber = json['program_number'];
    _versionNumber = json['version_number'];
    _openDate = json['open_date'];
    _netSales = json['net_sales'];
    _netSalesYears = json['net_sales_years'];
    _netProfit = json['net_profit'];
    _netProfitYears = json['net_profit_years'];
    _cashFlow = json['cash_flow'];
    _returnOnAssets = json['return_on_assets'];
    _debtOfAssets = json['debt_of_assets'];
    _finStatementYear = json['fin_statement_year'];
    _dueDate = json['due_date'];
    _apr = json['APR'];
    _infoStatementDateG = json['info_Statement_date_G'];
    _infoStatementDateH = json['info_Statement_date_h'];
    _financingType = json['financing_type'];
    _fundUse = json['fund_use'];
    _financingPeriod = json['financing_period'];
    _obtainFinanceDt = json['obtain_finance_dt'];
    _financeRepaymentDt = json['finance_repayment_dt'];
    _investmentStatus = json['investment_status'];
  }
  num? _id;
  num? _userId;
  num? _productId;
  num? _approvedStatus;
  dynamic _approveLoan;
  dynamic _note;
  String? _tagline;
  num? _sharePrice;
  num? _totalValuation;
  num? _minInvestment;
  num? _maxInvestment;
  String? _closeDate;
  dynamic _fundriserInvestment;
  num? _durationId;
  num? _returnsTypeId;
  String? _companyBio;
  String? _reasonToInvest;
  String? _investmentPlanning;
  String? _terms;
  num? _introduceTeam;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  String? _programNumber;
  num? _versionNumber;
  String? _openDate;
  num? _netSales;
  String? _netSalesYears;
  num? _netProfit;
  dynamic _netProfitYears;
  num? _cashFlow;
  num? _returnOnAssets;
  num? _debtOfAssets;
  String? _finStatementYear;
  String? _dueDate;
  num? _apr;
  String? _infoStatementDateG;
  String? _infoStatementDateH;
  String? _financingType;
  String? _fundUse;
  String? _financingPeriod;
  String? _obtainFinanceDt;
  String? _financeRepaymentDt;
  String? _investmentStatus;
MyOpportunity copyWith({  num? id,
  num? userId,
  num? productId,
  num? approvedStatus,
  dynamic approveLoan,
  dynamic note,
  String? tagline,
  num? sharePrice,
  num? totalValuation,
  num? minInvestment,
  num? maxInvestment,
  String? closeDate,
  dynamic fundriserInvestment,
  num? durationId,
  num? returnsTypeId,
  String? companyBio,
  String? reasonToInvest,
  String? investmentPlanning,
  String? terms,
  num? introduceTeam,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  String? programNumber,
  num? versionNumber,
  String? openDate,
  num? netSales,
  String? netSalesYears,
  num? netProfit,
  dynamic netProfitYears,
  num? cashFlow,
  num? returnOnAssets,
  num? debtOfAssets,
  String? finStatementYear,
  String? dueDate,
  num? apr,
  String? infoStatementDateG,
  String? infoStatementDateH,
  String? financingType,
  String? fundUse,
  String? financingPeriod,
  String? obtainFinanceDt,
  String? financeRepaymentDt,
  String? investmentStatus,
}) => MyOpportunity(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  approvedStatus: approvedStatus ?? _approvedStatus,
  approveLoan: approveLoan ?? _approveLoan,
  note: note ?? _note,
  tagline: tagline ?? _tagline,
  sharePrice: sharePrice ?? _sharePrice,
  totalValuation: totalValuation ?? _totalValuation,
  minInvestment: minInvestment ?? _minInvestment,
  maxInvestment: maxInvestment ?? _maxInvestment,
  closeDate: closeDate ?? _closeDate,
  fundriserInvestment: fundriserInvestment ?? _fundriserInvestment,
  durationId: durationId ?? _durationId,
  returnsTypeId: returnsTypeId ?? _returnsTypeId,
  companyBio: companyBio ?? _companyBio,
  reasonToInvest: reasonToInvest ?? _reasonToInvest,
  investmentPlanning: investmentPlanning ?? _investmentPlanning,
  terms: terms ?? _terms,
  introduceTeam: introduceTeam ?? _introduceTeam,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  programNumber: programNumber ?? _programNumber,
  versionNumber: versionNumber ?? _versionNumber,
  openDate: openDate ?? _openDate,
  netSales: netSales ?? _netSales,
  netSalesYears: netSalesYears ?? _netSalesYears,
  netProfit: netProfit ?? _netProfit,
  netProfitYears: netProfitYears ?? _netProfitYears,
  cashFlow: cashFlow ?? _cashFlow,
  returnOnAssets: returnOnAssets ?? _returnOnAssets,
  debtOfAssets: debtOfAssets ?? _debtOfAssets,
  finStatementYear: finStatementYear ?? _finStatementYear,
  dueDate: dueDate ?? _dueDate,
  apr: apr ?? _apr,
  infoStatementDateG: infoStatementDateG ?? _infoStatementDateG,
  infoStatementDateH: infoStatementDateH ?? _infoStatementDateH,
  financingType: financingType ?? _financingType,
  fundUse: fundUse ?? _fundUse,
  financingPeriod: financingPeriod ?? _financingPeriod,
  obtainFinanceDt: obtainFinanceDt ?? _obtainFinanceDt,
  financeRepaymentDt: financeRepaymentDt ?? _financeRepaymentDt,
  investmentStatus: investmentStatus ?? _investmentStatus,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get approvedStatus => _approvedStatus;
  dynamic get approveLoan => _approveLoan;
  dynamic get note => _note;
  String? get tagline => _tagline;
  num? get sharePrice => _sharePrice;
  num? get totalValuation => _totalValuation;
  num? get minInvestment => _minInvestment;
  num? get maxInvestment => _maxInvestment;
  String? get closeDate => _closeDate;
  dynamic get fundriserInvestment => _fundriserInvestment;
  num? get durationId => _durationId;
  num? get returnsTypeId => _returnsTypeId;
  String? get companyBio => _companyBio;
  String? get reasonToInvest => _reasonToInvest;
  String? get investmentPlanning => _investmentPlanning;
  String? get terms => _terms;
  num? get introduceTeam => _introduceTeam;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  String? get programNumber => _programNumber;
  num? get versionNumber => _versionNumber;
  String? get openDate => _openDate;
  num? get netSales => _netSales;
  String? get netSalesYears => _netSalesYears;
  num? get netProfit => _netProfit;
  dynamic get netProfitYears => _netProfitYears;
  num? get cashFlow => _cashFlow;
  num? get returnOnAssets => _returnOnAssets;
  num? get debtOfAssets => _debtOfAssets;
  String? get finStatementYear => _finStatementYear;
  String? get dueDate => _dueDate;
  num? get apr => _apr;
  String? get infoStatementDateG => _infoStatementDateG;
  String? get infoStatementDateH => _infoStatementDateH;
  String? get financingType => _financingType;
  String? get fundUse => _fundUse;
  String? get financingPeriod => _financingPeriod;
  String? get obtainFinanceDt => _obtainFinanceDt;
  String? get financeRepaymentDt => _financeRepaymentDt;
  String? get investmentStatus => _investmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['approved_status'] = _approvedStatus;
    map['approve_loan'] = _approveLoan;
    map['note'] = _note;
    map['tagline'] = _tagline;
    map['share_price'] = _sharePrice;
    map['total_valuation'] = _totalValuation;
    map['min_investment'] = _minInvestment;
    map['max_investment'] = _maxInvestment;
    map['close_date'] = _closeDate;
    map['fundriser_investment'] = _fundriserInvestment;
    map['duration_id'] = _durationId;
    map['returns_type_id'] = _returnsTypeId;
    map['company_bio'] = _companyBio;
    map['reason_to_invest'] = _reasonToInvest;
    map['investment_planning'] = _investmentPlanning;
    map['terms'] = _terms;
    map['introduce_team'] = _introduceTeam;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['program_number'] = _programNumber;
    map['version_number'] = _versionNumber;
    map['open_date'] = _openDate;
    map['net_sales'] = _netSales;
    map['net_sales_years'] = _netSalesYears;
    map['net_profit'] = _netProfit;
    map['net_profit_years'] = _netProfitYears;
    map['cash_flow'] = _cashFlow;
    map['return_on_assets'] = _returnOnAssets;
    map['debt_of_assets'] = _debtOfAssets;
    map['fin_statement_year'] = _finStatementYear;
    map['due_date'] = _dueDate;
    map['APR'] = _apr;
    map['info_Statement_date_G'] = _infoStatementDateG;
    map['info_Statement_date_h'] = _infoStatementDateH;
    map['financing_type'] = _financingType;
    map['fund_use'] = _fundUse;
    map['financing_period'] = _financingPeriod;
    map['obtain_finance_dt'] = _obtainFinanceDt;
    map['finance_repayment_dt'] = _financeRepaymentDt;
    map['investment_status'] = _investmentStatus;
    return map;
  }

}



CommingSoon commingSoonFromJson(String str) => CommingSoon.fromJson(json.decode(str));
String commingSoonToJson(CommingSoon data) => json.encode(data.toJson());
class CommingSoon {
  CommingSoon({
      num? id,
      num? userId,
      num? productId,
      num? approvedStatus,
      dynamic approveLoan,
      dynamic note,
      String? tagline,
      num? sharePrice,
      num? totalValuation,
      num? minInvestment,
      num? maxInvestment,
      dynamic closeDate,
      dynamic fundriserInvestment,
      num? durationId,
      num? returnsTypeId,
      String? companyBio,
      String? reasonToInvest,
      String? investmentPlanning,
      String? terms,
      num? introduceTeam,
      num? status,
      num? createdBy,
      String? createdAt,
      num? updatedBy,
      String? updatedAt,
      String? programNumber,
      num? versionNumber,
      String? openDate,
      num? netSales,
      String? netSalesYears,
      num? netProfit,
      String? netProfitYears,
      num? cashFlow,
      num? returnOnAssets,
      num? debtOfAssets,
      String? finStatementYear,
      dynamic dueDate,
      dynamic apr,
      dynamic infoStatementDateG,
      dynamic infoStatementDateH,
      String? financingType,
      String? fundUse,
      String? financingPeriod,
      String? obtainFinanceDt,
      String? financeRepaymentDt,
      String? investmentStatus,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _approvedStatus = approvedStatus;
    _approveLoan = approveLoan;
    _note = note;
    _tagline = tagline;
    _sharePrice = sharePrice;
    _totalValuation = totalValuation;
    _minInvestment = minInvestment;
    _maxInvestment = maxInvestment;
    _closeDate = closeDate;
    _fundriserInvestment = fundriserInvestment;
    _durationId = durationId;
    _returnsTypeId = returnsTypeId;
    _companyBio = companyBio;
    _reasonToInvest = reasonToInvest;
    _investmentPlanning = investmentPlanning;
    _terms = terms;
    _introduceTeam = introduceTeam;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _programNumber = programNumber;
    _versionNumber = versionNumber;
    _openDate = openDate;
    _netSales = netSales;
    _netSalesYears = netSalesYears;
    _netProfit = netProfit;
    _netProfitYears = netProfitYears;
    _cashFlow = cashFlow;
    _returnOnAssets = returnOnAssets;
    _debtOfAssets = debtOfAssets;
    _finStatementYear = finStatementYear;
    _dueDate = dueDate;
    _apr = apr;
    _infoStatementDateG = infoStatementDateG;
    _infoStatementDateH = infoStatementDateH;
    _financingType = financingType;
    _fundUse = fundUse;
    _financingPeriod = financingPeriod;
    _obtainFinanceDt = obtainFinanceDt;
    _financeRepaymentDt = financeRepaymentDt;
    _investmentStatus = investmentStatus;
}

  CommingSoon.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _approvedStatus = json['approved_status'];
    _approveLoan = json['approve_loan'];
    _note = json['note'];
    _tagline = json['tagline'];
    _sharePrice = json['share_price'];
    _totalValuation = json['total_valuation'];
    _minInvestment = json['min_investment'];
    _maxInvestment = json['max_investment'];
    _closeDate = json['close_date'];
    _fundriserInvestment = json['fundriser_investment'];
    _durationId = json['duration_id'];
    _returnsTypeId = json['returns_type_id'];
    _companyBio = json['company_bio'];
    _reasonToInvest = json['reason_to_invest'];
    _investmentPlanning = json['investment_planning'];
    _terms = json['terms'];
    _introduceTeam = json['introduce_team'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _programNumber = json['program_number'];
    _versionNumber = json['version_number'];
    _openDate = json['open_date'];
    _netSales = json['net_sales'];
    _netSalesYears = json['net_sales_years'];
    _netProfit = json['net_profit'];
    _netProfitYears = json['net_profit_years'];
    _cashFlow = json['cash_flow'];
    _returnOnAssets = json['return_on_assets'];
    _debtOfAssets = json['debt_of_assets'];
    _finStatementYear = json['fin_statement_year'];
    _dueDate = json['due_date'];
    _apr = json['APR'];
    _infoStatementDateG = json['info_Statement_date_G'];
    _infoStatementDateH = json['info_Statement_date_h'];
    _financingType = json['financing_type'];
    _fundUse = json['fund_use'];
    _financingPeriod = json['financing_period'];
    _obtainFinanceDt = json['obtain_finance_dt'];
    _financeRepaymentDt = json['finance_repayment_dt'];
    _investmentStatus = json['investment_status'];
  }
  num? _id;
  num? _userId;
  num? _productId;
  num? _approvedStatus;
  dynamic _approveLoan;
  dynamic _note;
  String? _tagline;
  num? _sharePrice;
  num? _totalValuation;
  num? _minInvestment;
  num? _maxInvestment;
  dynamic _closeDate;
  dynamic _fundriserInvestment;
  num? _durationId;
  num? _returnsTypeId;
  String? _companyBio;
  String? _reasonToInvest;
  String? _investmentPlanning;
  String? _terms;
  num? _introduceTeam;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  String? _programNumber;
  num? _versionNumber;
  String? _openDate;
  num? _netSales;
  String? _netSalesYears;
  num? _netProfit;
  String? _netProfitYears;
  num? _cashFlow;
  num? _returnOnAssets;
  num? _debtOfAssets;
  String? _finStatementYear;
  dynamic _dueDate;
  dynamic _apr;
  dynamic _infoStatementDateG;
  dynamic _infoStatementDateH;
  String? _financingType;
  String? _fundUse;
  String? _financingPeriod;
  String? _obtainFinanceDt;
  String? _financeRepaymentDt;
  String? _investmentStatus;
CommingSoon copyWith({  num? id,
  num? userId,
  num? productId,
  num? approvedStatus,
  dynamic approveLoan,
  dynamic note,
  String? tagline,
  num? sharePrice,
  num? totalValuation,
  num? minInvestment,
  num? maxInvestment,
  dynamic closeDate,
  dynamic fundriserInvestment,
  num? durationId,
  num? returnsTypeId,
  String? companyBio,
  String? reasonToInvest,
  String? investmentPlanning,
  String? terms,
  num? introduceTeam,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  String? programNumber,
  num? versionNumber,
  String? openDate,
  num? netSales,
  String? netSalesYears,
  num? netProfit,
  String? netProfitYears,
  num? cashFlow,
  num? returnOnAssets,
  num? debtOfAssets,
  String? finStatementYear,
  dynamic dueDate,
  dynamic apr,
  dynamic infoStatementDateG,
  dynamic infoStatementDateH,
  String? financingType,
  String? fundUse,
  String? financingPeriod,
  String? obtainFinanceDt,
  String? financeRepaymentDt,
  String? investmentStatus,
}) => CommingSoon(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  approvedStatus: approvedStatus ?? _approvedStatus,
  approveLoan: approveLoan ?? _approveLoan,
  note: note ?? _note,
  tagline: tagline ?? _tagline,
  sharePrice: sharePrice ?? _sharePrice,
  totalValuation: totalValuation ?? _totalValuation,
  minInvestment: minInvestment ?? _minInvestment,
  maxInvestment: maxInvestment ?? _maxInvestment,
  closeDate: closeDate ?? _closeDate,
  fundriserInvestment: fundriserInvestment ?? _fundriserInvestment,
  durationId: durationId ?? _durationId,
  returnsTypeId: returnsTypeId ?? _returnsTypeId,
  companyBio: companyBio ?? _companyBio,
  reasonToInvest: reasonToInvest ?? _reasonToInvest,
  investmentPlanning: investmentPlanning ?? _investmentPlanning,
  terms: terms ?? _terms,
  introduceTeam: introduceTeam ?? _introduceTeam,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  programNumber: programNumber ?? _programNumber,
  versionNumber: versionNumber ?? _versionNumber,
  openDate: openDate ?? _openDate,
  netSales: netSales ?? _netSales,
  netSalesYears: netSalesYears ?? _netSalesYears,
  netProfit: netProfit ?? _netProfit,
  netProfitYears: netProfitYears ?? _netProfitYears,
  cashFlow: cashFlow ?? _cashFlow,
  returnOnAssets: returnOnAssets ?? _returnOnAssets,
  debtOfAssets: debtOfAssets ?? _debtOfAssets,
  finStatementYear: finStatementYear ?? _finStatementYear,
  dueDate: dueDate ?? _dueDate,
  apr: apr ?? _apr,
  infoStatementDateG: infoStatementDateG ?? _infoStatementDateG,
  infoStatementDateH: infoStatementDateH ?? _infoStatementDateH,
  financingType: financingType ?? _financingType,
  fundUse: fundUse ?? _fundUse,
  financingPeriod: financingPeriod ?? _financingPeriod,
  obtainFinanceDt: obtainFinanceDt ?? _obtainFinanceDt,
  financeRepaymentDt: financeRepaymentDt ?? _financeRepaymentDt,
  investmentStatus: investmentStatus ?? _investmentStatus,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get approvedStatus => _approvedStatus;
  dynamic get approveLoan => _approveLoan;
  dynamic get note => _note;
  String? get tagline => _tagline;
  num? get sharePrice => _sharePrice;
  num? get totalValuation => _totalValuation;
  num? get minInvestment => _minInvestment;
  num? get maxInvestment => _maxInvestment;
  dynamic get closeDate => _closeDate;
  dynamic get fundriserInvestment => _fundriserInvestment;
  num? get durationId => _durationId;
  num? get returnsTypeId => _returnsTypeId;
  String? get companyBio => _companyBio;
  String? get reasonToInvest => _reasonToInvest;
  String? get investmentPlanning => _investmentPlanning;
  String? get terms => _terms;
  num? get introduceTeam => _introduceTeam;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  String? get programNumber => _programNumber;
  num? get versionNumber => _versionNumber;
  String? get openDate => _openDate;
  num? get netSales => _netSales;
  String? get netSalesYears => _netSalesYears;
  num? get netProfit => _netProfit;
  String? get netProfitYears => _netProfitYears;
  num? get cashFlow => _cashFlow;
  num? get returnOnAssets => _returnOnAssets;
  num? get debtOfAssets => _debtOfAssets;
  String? get finStatementYear => _finStatementYear;
  dynamic get dueDate => _dueDate;
  dynamic get apr => _apr;
  dynamic get infoStatementDateG => _infoStatementDateG;
  dynamic get infoStatementDateH => _infoStatementDateH;
  String? get financingType => _financingType;
  String? get fundUse => _fundUse;
  String? get financingPeriod => _financingPeriod;
  String? get obtainFinanceDt => _obtainFinanceDt;
  String? get financeRepaymentDt => _financeRepaymentDt;
  String? get investmentStatus => _investmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['approved_status'] = _approvedStatus;
    map['approve_loan'] = _approveLoan;
    map['note'] = _note;
    map['tagline'] = _tagline;
    map['share_price'] = _sharePrice;
    map['total_valuation'] = _totalValuation;
    map['min_investment'] = _minInvestment;
    map['max_investment'] = _maxInvestment;
    map['close_date'] = _closeDate;
    map['fundriser_investment'] = _fundriserInvestment;
    map['duration_id'] = _durationId;
    map['returns_type_id'] = _returnsTypeId;
    map['company_bio'] = _companyBio;
    map['reason_to_invest'] = _reasonToInvest;
    map['investment_planning'] = _investmentPlanning;
    map['terms'] = _terms;
    map['introduce_team'] = _introduceTeam;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['program_number'] = _programNumber;
    map['version_number'] = _versionNumber;
    map['open_date'] = _openDate;
    map['net_sales'] = _netSales;
    map['net_sales_years'] = _netSalesYears;
    map['net_profit'] = _netProfit;
    map['net_profit_years'] = _netProfitYears;
    map['cash_flow'] = _cashFlow;
    map['return_on_assets'] = _returnOnAssets;
    map['debt_of_assets'] = _debtOfAssets;
    map['fin_statement_year'] = _finStatementYear;
    map['due_date'] = _dueDate;
    map['APR'] = _apr;
    map['info_Statement_date_G'] = _infoStatementDateG;
    map['info_Statement_date_h'] = _infoStatementDateH;
    map['financing_type'] = _financingType;
    map['fund_use'] = _fundUse;
    map['financing_period'] = _financingPeriod;
    map['obtain_finance_dt'] = _obtainFinanceDt;
    map['finance_repayment_dt'] = _financeRepaymentDt;
    map['investment_status'] = _investmentStatus;
    return map;
  }

}



OpenDate openDateFromJson(String str) => OpenDate.fromJson(json.decode(str));
String openDateToJson(OpenDate data) => json.encode(data.toJson());
class OpenDate {
  OpenDate({
      num? id, 
      num? userId, 
      num? productId, 
      num? approvedStatus, 
      dynamic approveLoan, 
      dynamic note, 
      String? tagline, 
      num? sharePrice, 
      num? totalValuation, 
      num? minInvestment, 
      num? maxInvestment, 
      String? closeDate, 
      dynamic fundriserInvestment, 
      num? durationId, 
      num? returnsTypeId, 
      String? companyBio, 
      String? reasonToInvest, 
      String? investmentPlanning, 
      String? terms, 
      num? introduceTeam, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      String? programNumber, 
      num? versionNumber, 
      String? openDate, 
      num? netSales, 
      String? netSalesYears, 
      num? netProfit, 
      dynamic netProfitYears,
      num? cashFlow, 
      num? returnOnAssets, 
      num? debtOfAssets, 
      String? finStatementYear, 
      String? dueDate, 
      num? apr, 
      String? infoStatementDateG, 
      String? infoStatementDateH, 
      String? financingType, 
      String? fundUse, 
      String? financingPeriod, 
      String? obtainFinanceDt, 
      String? financeRepaymentDt, 
      String? investmentStatus,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _approvedStatus = approvedStatus;
    _approveLoan = approveLoan;
    _note = note;
    _tagline = tagline;
    _sharePrice = sharePrice;
    _totalValuation = totalValuation;
    _minInvestment = minInvestment;
    _maxInvestment = maxInvestment;
    _closeDate = closeDate;
    _fundriserInvestment = fundriserInvestment;
    _durationId = durationId;
    _returnsTypeId = returnsTypeId;
    _companyBio = companyBio;
    _reasonToInvest = reasonToInvest;
    _investmentPlanning = investmentPlanning;
    _terms = terms;
    _introduceTeam = introduceTeam;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _programNumber = programNumber;
    _versionNumber = versionNumber;
    _openDate = openDate;
    _netSales = netSales;
    _netSalesYears = netSalesYears;
    _netProfit = netProfit;
    _netProfitYears = netProfitYears;
    _cashFlow = cashFlow;
    _returnOnAssets = returnOnAssets;
    _debtOfAssets = debtOfAssets;
    _finStatementYear = finStatementYear;
    _dueDate = dueDate;
    _apr = apr;
    _infoStatementDateG = infoStatementDateG;
    _infoStatementDateH = infoStatementDateH;
    _financingType = financingType;
    _fundUse = fundUse;
    _financingPeriod = financingPeriod;
    _obtainFinanceDt = obtainFinanceDt;
    _financeRepaymentDt = financeRepaymentDt;
    _investmentStatus = investmentStatus;
}

  OpenDate.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _approvedStatus = json['approved_status'];
    _approveLoan = json['approve_loan'];
    _note = json['note'];
    _tagline = json['tagline'];
    _sharePrice = json['share_price'];
    _totalValuation = json['total_valuation'];
    _minInvestment = json['min_investment'];
    _maxInvestment = json['max_investment'];
    _closeDate = json['close_date'];
    _fundriserInvestment = json['fundriser_investment'];
    _durationId = json['duration_id'];
    _returnsTypeId = json['returns_type_id'];
    _companyBio = json['company_bio'];
    _reasonToInvest = json['reason_to_invest'];
    _investmentPlanning = json['investment_planning'];
    _terms = json['terms'];
    _introduceTeam = json['introduce_team'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _programNumber = json['program_number'];
    _versionNumber = json['version_number'];
    _openDate = json['open_date'];
    _netSales = json['net_sales'];
    _netSalesYears = json['net_sales_years'];
    _netProfit = json['net_profit'];
    _netProfitYears = json['net_profit_years'];
    _cashFlow = json['cash_flow'];
    _returnOnAssets = json['return_on_assets'];
    _debtOfAssets = json['debt_of_assets'];
    _finStatementYear = json['fin_statement_year'];
    _dueDate = json['due_date'];
    _apr = json['APR'];
    _infoStatementDateG = json['info_Statement_date_G'];
    _infoStatementDateH = json['info_Statement_date_h'];
    _financingType = json['financing_type'];
    _fundUse = json['fund_use'];
    _financingPeriod = json['financing_period'];
    _obtainFinanceDt = json['obtain_finance_dt'];
    _financeRepaymentDt = json['finance_repayment_dt'];
    _investmentStatus = json['investment_status'];
  }
  num? _id;
  num? _userId;
  num? _productId;
  num? _approvedStatus;
  dynamic _approveLoan;
  dynamic _note;
  String? _tagline;
  num? _sharePrice;
  num? _totalValuation;
  num? _minInvestment;
  num? _maxInvestment;
  String? _closeDate;
  dynamic _fundriserInvestment;
  num? _durationId;
  num? _returnsTypeId;
  String? _companyBio;
  String? _reasonToInvest;
  String? _investmentPlanning;
  String? _terms;
  num? _introduceTeam;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  String? _programNumber;
  num? _versionNumber;
  String? _openDate;
  num? _netSales;
  String? _netSalesYears;
  num? _netProfit;
  dynamic _netProfitYears;
  num? _cashFlow;
  num? _returnOnAssets;
  num? _debtOfAssets;
  String? _finStatementYear;
  String? _dueDate;
  num? _apr;
  String? _infoStatementDateG;
  String? _infoStatementDateH;
  String? _financingType;
  String? _fundUse;
  String? _financingPeriod;
  String? _obtainFinanceDt;
  String? _financeRepaymentDt;
  String? _investmentStatus;
OpenDate copyWith({  num? id,
  num? userId,
  num? productId,
  num? approvedStatus,
  dynamic approveLoan,
  dynamic note,
  String? tagline,
  num? sharePrice,
  num? totalValuation,
  num? minInvestment,
  num? maxInvestment,
  String? closeDate,
  dynamic fundriserInvestment,
  num? durationId,
  num? returnsTypeId,
  String? companyBio,
  String? reasonToInvest,
  String? investmentPlanning,
  String? terms,
  num? introduceTeam,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  String? programNumber,
  num? versionNumber,
  String? openDate,
  num? netSales,
  String? netSalesYears,
  num? netProfit,
  dynamic netProfitYears,
  num? cashFlow,
  num? returnOnAssets,
  num? debtOfAssets,
  String? finStatementYear,
  String? dueDate,
  num? apr,
  String? infoStatementDateG,
  String? infoStatementDateH,
  String? financingType,
  String? fundUse,
  String? financingPeriod,
  String? obtainFinanceDt,
  String? financeRepaymentDt,
  String? investmentStatus,
}) => OpenDate(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  approvedStatus: approvedStatus ?? _approvedStatus,
  approveLoan: approveLoan ?? _approveLoan,
  note: note ?? _note,
  tagline: tagline ?? _tagline,
  sharePrice: sharePrice ?? _sharePrice,
  totalValuation: totalValuation ?? _totalValuation,
  minInvestment: minInvestment ?? _minInvestment,
  maxInvestment: maxInvestment ?? _maxInvestment,
  closeDate: closeDate ?? _closeDate,
  fundriserInvestment: fundriserInvestment ?? _fundriserInvestment,
  durationId: durationId ?? _durationId,
  returnsTypeId: returnsTypeId ?? _returnsTypeId,
  companyBio: companyBio ?? _companyBio,
  reasonToInvest: reasonToInvest ?? _reasonToInvest,
  investmentPlanning: investmentPlanning ?? _investmentPlanning,
  terms: terms ?? _terms,
  introduceTeam: introduceTeam ?? _introduceTeam,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  programNumber: programNumber ?? _programNumber,
  versionNumber: versionNumber ?? _versionNumber,
  openDate: openDate ?? _openDate,
  netSales: netSales ?? _netSales,
  netSalesYears: netSalesYears ?? _netSalesYears,
  netProfit: netProfit ?? _netProfit,
  netProfitYears: netProfitYears ?? _netProfitYears,
  cashFlow: cashFlow ?? _cashFlow,
  returnOnAssets: returnOnAssets ?? _returnOnAssets,
  debtOfAssets: debtOfAssets ?? _debtOfAssets,
  finStatementYear: finStatementYear ?? _finStatementYear,
  dueDate: dueDate ?? _dueDate,
  apr: apr ?? _apr,
  infoStatementDateG: infoStatementDateG ?? _infoStatementDateG,
  infoStatementDateH: infoStatementDateH ?? _infoStatementDateH,
  financingType: financingType ?? _financingType,
  fundUse: fundUse ?? _fundUse,
  financingPeriod: financingPeriod ?? _financingPeriod,
  obtainFinanceDt: obtainFinanceDt ?? _obtainFinanceDt,
  financeRepaymentDt: financeRepaymentDt ?? _financeRepaymentDt,
  investmentStatus: investmentStatus ?? _investmentStatus,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get approvedStatus => _approvedStatus;
  dynamic get approveLoan => _approveLoan;
  dynamic get note => _note;
  String? get tagline => _tagline;
  num? get sharePrice => _sharePrice;
  num? get totalValuation => _totalValuation;
  num? get minInvestment => _minInvestment;
  num? get maxInvestment => _maxInvestment;
  String? get closeDate => _closeDate;
  dynamic get fundriserInvestment => _fundriserInvestment;
  num? get durationId => _durationId;
  num? get returnsTypeId => _returnsTypeId;
  String? get companyBio => _companyBio;
  String? get reasonToInvest => _reasonToInvest;
  String? get investmentPlanning => _investmentPlanning;
  String? get terms => _terms;
  num? get introduceTeam => _introduceTeam;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  String? get programNumber => _programNumber;
  num? get versionNumber => _versionNumber;
  String? get openDate => _openDate;
  num? get netSales => _netSales;
  String? get netSalesYears => _netSalesYears;
  num? get netProfit => _netProfit;
  dynamic get netProfitYears => _netProfitYears;
  num? get cashFlow => _cashFlow;
  num? get returnOnAssets => _returnOnAssets;
  num? get debtOfAssets => _debtOfAssets;
  String? get finStatementYear => _finStatementYear;
  String? get dueDate => _dueDate;
  num? get apr => _apr;
  String? get infoStatementDateG => _infoStatementDateG;
  String? get infoStatementDateH => _infoStatementDateH;
  String? get financingType => _financingType;
  String? get fundUse => _fundUse;
  String? get financingPeriod => _financingPeriod;
  String? get obtainFinanceDt => _obtainFinanceDt;
  String? get financeRepaymentDt => _financeRepaymentDt;
  String? get investmentStatus => _investmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['approved_status'] = _approvedStatus;
    map['approve_loan'] = _approveLoan;
    map['note'] = _note;
    map['tagline'] = _tagline;
    map['share_price'] = _sharePrice;
    map['total_valuation'] = _totalValuation;
    map['min_investment'] = _minInvestment;
    map['max_investment'] = _maxInvestment;
    map['close_date'] = _closeDate;
    map['fundriser_investment'] = _fundriserInvestment;
    map['duration_id'] = _durationId;
    map['returns_type_id'] = _returnsTypeId;
    map['company_bio'] = _companyBio;
    map['reason_to_invest'] = _reasonToInvest;
    map['investment_planning'] = _investmentPlanning;
    map['terms'] = _terms;
    map['introduce_team'] = _introduceTeam;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['program_number'] = _programNumber;
    map['version_number'] = _versionNumber;
    map['open_date'] = _openDate;
    map['net_sales'] = _netSales;
    map['net_sales_years'] = _netSalesYears;
    map['net_profit'] = _netProfit;
    map['net_profit_years'] = _netProfitYears;
    map['cash_flow'] = _cashFlow;
    map['return_on_assets'] = _returnOnAssets;
    map['debt_of_assets'] = _debtOfAssets;
    map['fin_statement_year'] = _finStatementYear;
    map['due_date'] = _dueDate;
    map['APR'] = _apr;
    map['info_Statement_date_G'] = _infoStatementDateG;
    map['info_Statement_date_h'] = _infoStatementDateH;
    map['financing_type'] = _financingType;
    map['fund_use'] = _fundUse;
    map['financing_period'] = _financingPeriod;
    map['obtain_finance_dt'] = _obtainFinanceDt;
    map['finance_repayment_dt'] = _financeRepaymentDt;
    map['investment_status'] = _investmentStatus;
    return map;
  }

}



CloseDate closeDateFromJson(String str) => CloseDate.fromJson(json.decode(str));
String closeDateToJson(CloseDate data) => json.encode(data.toJson());
class CloseDate {
  CloseDate({
      num? id, 
      num? userId, 
      num? productId, 
      num? approvedStatus, 
      num? approveLoan, 
      dynamic note, 
      dynamic tagline, 
      num? sharePrice, 
      num? totalValuation, 
      num? minInvestment, 
      num? maxInvestment, 
      String? closeDate, 
      num? fundriserInvestment, 
      num? durationId, 
      num? returnsTypeId, 
      String? companyBio, 
      String? reasonToInvest, 
      String? investmentPlanning, 
      String? terms, 
      num? introduceTeam, 
      num? status, 
      num? createdBy, 
      String? createdAt, 
      num? updatedBy, 
      String? updatedAt, 
      String? programNumber, 
      num? versionNumber, 
      String? openDate, 
      num? netSales, 
      String? netSalesYears, 
      num? netProfit, 
      String? netProfitYears, 
      num? cashFlow, 
      num? returnOnAssets, 
      num? debtOfAssets, 
      String? finStatementYear, 
      String? dueDate, 
      num? apr, 
      String? infoStatementDateG, 
      String? infoStatementDateH, 
      String? financingType, 
      String? fundUse, 
      String? financingPeriod, 
      String? obtainFinanceDt, 
      String? financeRepaymentDt, 
      String? investmentStatus,}){
    _id = id;
    _userId = userId;
    _productId = productId;
    _approvedStatus = approvedStatus;
    _approveLoan = approveLoan;
    _note = note;
    _tagline = tagline;
    _sharePrice = sharePrice;
    _totalValuation = totalValuation;
    _minInvestment = minInvestment;
    _maxInvestment = maxInvestment;
    _closeDate = closeDate;
    _fundriserInvestment = fundriserInvestment;
    _durationId = durationId;
    _returnsTypeId = returnsTypeId;
    _companyBio = companyBio;
    _reasonToInvest = reasonToInvest;
    _investmentPlanning = investmentPlanning;
    _terms = terms;
    _introduceTeam = introduceTeam;
    _status = status;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _programNumber = programNumber;
    _versionNumber = versionNumber;
    _openDate = openDate;
    _netSales = netSales;
    _netSalesYears = netSalesYears;
    _netProfit = netProfit;
    _netProfitYears = netProfitYears;
    _cashFlow = cashFlow;
    _returnOnAssets = returnOnAssets;
    _debtOfAssets = debtOfAssets;
    _finStatementYear = finStatementYear;
    _dueDate = dueDate;
    _apr = apr;
    _infoStatementDateG = infoStatementDateG;
    _infoStatementDateH = infoStatementDateH;
    _financingType = financingType;
    _fundUse = fundUse;
    _financingPeriod = financingPeriod;
    _obtainFinanceDt = obtainFinanceDt;
    _financeRepaymentDt = financeRepaymentDt;
    _investmentStatus = investmentStatus;
}

  CloseDate.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _approvedStatus = json['approved_status'];
    _approveLoan = json['approve_loan'];
    _note = json['note'];
    _tagline = json['tagline'];
    _sharePrice = json['share_price'];
    _totalValuation = json['total_valuation'];
    _minInvestment = json['min_investment'];
    _maxInvestment = json['max_investment'];
    _closeDate = json['close_date'];
    _fundriserInvestment = json['fundriser_investment'];
    _durationId = json['duration_id'];
    _returnsTypeId = json['returns_type_id'];
    _companyBio = json['company_bio'];
    _reasonToInvest = json['reason_to_invest'];
    _investmentPlanning = json['investment_planning'];
    _terms = json['terms'];
    _introduceTeam = json['introduce_team'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _programNumber = json['program_number'];
    _versionNumber = json['version_number'];
    _openDate = json['open_date'];
    _netSales = json['net_sales'];
    _netSalesYears = json['net_sales_years'];
    _netProfit = json['net_profit'];
    _netProfitYears = json['net_profit_years'];
    _cashFlow = json['cash_flow'];
    _returnOnAssets = json['return_on_assets'];
    _debtOfAssets = json['debt_of_assets'];
    _finStatementYear = json['fin_statement_year'];
    _dueDate = json['due_date'];
    _apr = json['APR'];
    _infoStatementDateG = json['info_Statement_date_G'];
    _infoStatementDateH = json['info_Statement_date_h'];
    _financingType = json['financing_type'];
    _fundUse = json['fund_use'];
    _financingPeriod = json['financing_period'];
    _obtainFinanceDt = json['obtain_finance_dt'];
    _financeRepaymentDt = json['finance_repayment_dt'];
    _investmentStatus = json['investment_status'];
  }
  num? _id;
  num? _userId;
  num? _productId;
  num? _approvedStatus;
  num? _approveLoan;
  dynamic _note;
  dynamic _tagline;
  num? _sharePrice;
  num? _totalValuation;
  num? _minInvestment;
  num? _maxInvestment;
  String? _closeDate;
  num? _fundriserInvestment;
  num? _durationId;
  num? _returnsTypeId;
  String? _companyBio;
  String? _reasonToInvest;
  String? _investmentPlanning;
  String? _terms;
  num? _introduceTeam;
  num? _status;
  num? _createdBy;
  String? _createdAt;
  num? _updatedBy;
  String? _updatedAt;
  String? _programNumber;
  num? _versionNumber;
  String? _openDate;
  num? _netSales;
  String? _netSalesYears;
  num? _netProfit;
  String? _netProfitYears;
  num? _cashFlow;
  num? _returnOnAssets;
  num? _debtOfAssets;
  String? _finStatementYear;
  String? _dueDate;
  num? _apr;
  String? _infoStatementDateG;
  String? _infoStatementDateH;
  String? _financingType;
  String? _fundUse;
  String? _financingPeriod;
  String? _obtainFinanceDt;
  String? _financeRepaymentDt;
  String? _investmentStatus;
CloseDate copyWith({  num? id,
  num? userId,
  num? productId,
  num? approvedStatus,
  num? approveLoan,
  dynamic note,
  dynamic tagline,
  num? sharePrice,
  num? totalValuation,
  num? minInvestment,
  num? maxInvestment,
  String? closeDate,
  num? fundriserInvestment,
  num? durationId,
  num? returnsTypeId,
  String? companyBio,
  String? reasonToInvest,
  String? investmentPlanning,
  String? terms,
  num? introduceTeam,
  num? status,
  num? createdBy,
  String? createdAt,
  num? updatedBy,
  String? updatedAt,
  String? programNumber,
  num? versionNumber,
  String? openDate,
  num? netSales,
  String? netSalesYears,
  num? netProfit,
  String? netProfitYears,
  num? cashFlow,
  num? returnOnAssets,
  num? debtOfAssets,
  String? finStatementYear,
  String? dueDate,
  num? apr,
  String? infoStatementDateG,
  String? infoStatementDateH,
  String? financingType,
  String? fundUse,
  String? financingPeriod,
  String? obtainFinanceDt,
  String? financeRepaymentDt,
  String? investmentStatus,
}) => CloseDate(  id: id ?? _id,
  userId: userId ?? _userId,
  productId: productId ?? _productId,
  approvedStatus: approvedStatus ?? _approvedStatus,
  approveLoan: approveLoan ?? _approveLoan,
  note: note ?? _note,
  tagline: tagline ?? _tagline,
  sharePrice: sharePrice ?? _sharePrice,
  totalValuation: totalValuation ?? _totalValuation,
  minInvestment: minInvestment ?? _minInvestment,
  maxInvestment: maxInvestment ?? _maxInvestment,
  closeDate: closeDate ?? _closeDate,
  fundriserInvestment: fundriserInvestment ?? _fundriserInvestment,
  durationId: durationId ?? _durationId,
  returnsTypeId: returnsTypeId ?? _returnsTypeId,
  companyBio: companyBio ?? _companyBio,
  reasonToInvest: reasonToInvest ?? _reasonToInvest,
  investmentPlanning: investmentPlanning ?? _investmentPlanning,
  terms: terms ?? _terms,
  introduceTeam: introduceTeam ?? _introduceTeam,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  programNumber: programNumber ?? _programNumber,
  versionNumber: versionNumber ?? _versionNumber,
  openDate: openDate ?? _openDate,
  netSales: netSales ?? _netSales,
  netSalesYears: netSalesYears ?? _netSalesYears,
  netProfit: netProfit ?? _netProfit,
  netProfitYears: netProfitYears ?? _netProfitYears,
  cashFlow: cashFlow ?? _cashFlow,
  returnOnAssets: returnOnAssets ?? _returnOnAssets,
  debtOfAssets: debtOfAssets ?? _debtOfAssets,
  finStatementYear: finStatementYear ?? _finStatementYear,
  dueDate: dueDate ?? _dueDate,
  apr: apr ?? _apr,
  infoStatementDateG: infoStatementDateG ?? _infoStatementDateG,
  infoStatementDateH: infoStatementDateH ?? _infoStatementDateH,
  financingType: financingType ?? _financingType,
  fundUse: fundUse ?? _fundUse,
  financingPeriod: financingPeriod ?? _financingPeriod,
  obtainFinanceDt: obtainFinanceDt ?? _obtainFinanceDt,
  financeRepaymentDt: financeRepaymentDt ?? _financeRepaymentDt,
  investmentStatus: investmentStatus ?? _investmentStatus,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get productId => _productId;
  num? get approvedStatus => _approvedStatus;
  num? get approveLoan => _approveLoan;
  dynamic get note => _note;
  dynamic get tagline => _tagline;
  num? get sharePrice => _sharePrice;
  num? get totalValuation => _totalValuation;
  num? get minInvestment => _minInvestment;
  num? get maxInvestment => _maxInvestment;
  String? get closeDate => _closeDate;
  num? get fundriserInvestment => _fundriserInvestment;
  num? get durationId => _durationId;
  num? get returnsTypeId => _returnsTypeId;
  String? get companyBio => _companyBio;
  String? get reasonToInvest => _reasonToInvest;
  String? get investmentPlanning => _investmentPlanning;
  String? get terms => _terms;
  num? get introduceTeam => _introduceTeam;
  num? get status => _status;
  num? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  num? get updatedBy => _updatedBy;
  String? get updatedAt => _updatedAt;
  String? get programNumber => _programNumber;
  num? get versionNumber => _versionNumber;
  String? get openDate => _openDate;
  num? get netSales => _netSales;
  String? get netSalesYears => _netSalesYears;
  num? get netProfit => _netProfit;
  String? get netProfitYears => _netProfitYears;
  num? get cashFlow => _cashFlow;
  num? get returnOnAssets => _returnOnAssets;
  num? get debtOfAssets => _debtOfAssets;
  String? get finStatementYear => _finStatementYear;
  String? get dueDate => _dueDate;
  num? get apr => _apr;
  String? get infoStatementDateG => _infoStatementDateG;
  String? get infoStatementDateH => _infoStatementDateH;
  String? get financingType => _financingType;
  String? get fundUse => _fundUse;
  String? get financingPeriod => _financingPeriod;
  String? get obtainFinanceDt => _obtainFinanceDt;
  String? get financeRepaymentDt => _financeRepaymentDt;
  String? get investmentStatus => _investmentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['approved_status'] = _approvedStatus;
    map['approve_loan'] = _approveLoan;
    map['note'] = _note;
    map['tagline'] = _tagline;
    map['share_price'] = _sharePrice;
    map['total_valuation'] = _totalValuation;
    map['min_investment'] = _minInvestment;
    map['max_investment'] = _maxInvestment;
    map['close_date'] = _closeDate;
    map['fundriser_investment'] = _fundriserInvestment;
    map['duration_id'] = _durationId;
    map['returns_type_id'] = _returnsTypeId;
    map['company_bio'] = _companyBio;
    map['reason_to_invest'] = _reasonToInvest;
    map['investment_planning'] = _investmentPlanning;
    map['terms'] = _terms;
    map['introduce_team'] = _introduceTeam;
    map['status'] = _status;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['program_number'] = _programNumber;
    map['version_number'] = _versionNumber;
    map['open_date'] = _openDate;
    map['net_sales'] = _netSales;
    map['net_sales_years'] = _netSalesYears;
    map['net_profit'] = _netProfit;
    map['net_profit_years'] = _netProfitYears;
    map['cash_flow'] = _cashFlow;
    map['return_on_assets'] = _returnOnAssets;
    map['debt_of_assets'] = _debtOfAssets;
    map['fin_statement_year'] = _finStatementYear;
    map['due_date'] = _dueDate;
    map['APR'] = _apr;
    map['info_Statement_date_G'] = _infoStatementDateG;
    map['info_Statement_date_h'] = _infoStatementDateH;
    map['financing_type'] = _financingType;
    map['fund_use'] = _fundUse;
    map['financing_period'] = _financingPeriod;
    map['obtain_finance_dt'] = _obtainFinanceDt;
    map['finance_repayment_dt'] = _financeRepaymentDt;
    map['investment_status'] = _investmentStatus;
    return map;
  }

}
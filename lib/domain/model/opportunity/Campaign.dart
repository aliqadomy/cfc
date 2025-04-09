import 'CampaignImages.dart';
import 'Team.dart';

class Campaign {
  Campaign({
      this.id, 
      this.userId, 
      this.tagline, 
      this.sharePrice, 
      this.totalValuation, 
      this.minInvestment, 
      this.maxInvestment, 
      this.fundriserInvestment, 
      this.companyBio, 
      this.reasonToInvest, 
      this.investmentPlanning, 
      this.terms, 
      this.introduceTeam, 
      this.status, 
      this.approvedStatus, 
      this.note, 
      this.campaignImages, 
      this.team,});

  Campaign.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    tagline = json['tagline'];
    sharePrice = json['share_price'];
    totalValuation = json['total_valuation'];
    minInvestment = json['min_investment'];
    maxInvestment = json['max_investment'];
    fundriserInvestment = json['fundriser_investment'];
    companyBio = json['company_bio'];
    reasonToInvest = json['reason_to_invest'];
    investmentPlanning = json['investment_planning'];
    terms = json['terms'];
    introduceTeam = json['introduce_team'];
    status = json['status'];
    approvedStatus = json['approved_status'];
    note = json['note'];
    if (json['campaign_images'] != null) {
      campaignImages = [];
      json['campaign_images'].forEach((v) {
        campaignImages!.add(CampaignImages.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = [];
      json['team'].forEach((v) {
        team!.add(Team.fromJson(v));
      });
    }
  }
  int? id;
  int? userId;
  String? tagline;
  int? sharePrice;
  int? totalValuation;
  int? minInvestment;
  int? maxInvestment;
  dynamic fundriserInvestment;
  String? companyBio;
  String? reasonToInvest;
  String? investmentPlanning;
  String? terms;
  int? introduceTeam;
  int? status;
  int? approvedStatus;
  dynamic note;
  List<CampaignImages>? campaignImages;
  List<Team>? team;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['tagline'] = tagline;
    map['share_price'] = sharePrice;
    map['total_valuation'] = totalValuation;
    map['min_investment'] = minInvestment;
    map['max_investment'] = maxInvestment;
    map['fundriser_investment'] = fundriserInvestment;
    map['company_bio'] = companyBio;
    map['reason_to_invest'] = reasonToInvest;
    map['investment_planning'] = investmentPlanning;
    map['terms'] = terms;
    map['introduce_team'] = introduceTeam;
    map['status'] = status;
    map['approved_status'] = approvedStatus;
    map['note'] = note;
    if (campaignImages != null) {
      map['campaign_images'] = campaignImages!.map((v) => v.toJson()).toList();
    }
    if (team != null) {
      map['team'] = team!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
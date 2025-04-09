import 'Campaign.dart';
import 'Evaluation.dart';
import 'BorrowerStatement.dart';

class OpportunityDetails {
  OpportunityDetails({
      this.campaign, 
      this.evaluation, 
      this.borrowerStatement,});

  OpportunityDetails.fromJson(dynamic json) {
    campaign = json['campaign'] != null ? Campaign.fromJson(json['campaign']) : null;
    if (json['evaluation'] != null) {
      evaluation = [];
      json['evaluation'].forEach((v) {
        evaluation!.add(Evaluation.fromJson(v));
      });
    }
    if (json['borrower_statement'] != null) {
      borrowerStatement = [];
      json['borrower_statement'].forEach((v) {
        borrowerStatement!.add(BorrowerStatement.fromJson(v));
      });
    }
  }
  Campaign? campaign;
  List<Evaluation>? evaluation;
  List<BorrowerStatement>? borrowerStatement;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (campaign != null) {
      map['campaign'] = campaign!.toJson();
    }
    if (evaluation != null) {
      map['evaluation'] = evaluation!.map((v) => v.toJson()).toList();
    }
    if (borrowerStatement != null) {
      map['borrower_statement'] = borrowerStatement!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
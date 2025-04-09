part of 'oppourtunity_data_details_bloc.dart';

@immutable
abstract class OppourtunityDataDetailsEvent {}

class OppourtinityDataDetailsEvents extends OppourtunityDataDetailsEvent{

  OppourtinityDataDetailsEvents({required this.id});
  int? id;
}
class InvestOpportunity extends OppourtunityDataDetailsEvent{

  InvestOpportunity({required this.amount,});
  int? amount;
  int? campagin;
  int? invester;
}
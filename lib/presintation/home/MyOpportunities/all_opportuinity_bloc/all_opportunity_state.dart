part of 'all_opportunity_bloc.dart';

@immutable
abstract class AllOpportunityState {}

class AllOpportunityInitial extends AllOpportunityState {}

class AllOpportunitySuccess extends AllOpportunityState{
  AllOpportunityModel allOpportunityModel;
  AllOpportunitySuccess({required this.allOpportunityModel});
}
class AllOpportunityFailed extends AllOpportunityState{
  String errMsg;
  AllOpportunityFailed({required this.errMsg});

}
class AllOpportunityLoading extends AllOpportunityState{}

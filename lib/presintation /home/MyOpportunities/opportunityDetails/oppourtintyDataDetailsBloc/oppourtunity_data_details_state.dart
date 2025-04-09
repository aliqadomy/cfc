part of 'oppourtunity_data_details_bloc.dart';


@immutable
abstract class OppourtunityDataDetailsState {}

class OppourtunityDataDetailsInitial extends OppourtunityDataDetailsState {}


class OppourtinityDataDetailsSuccess extends OppourtunityDataDetailsState
{
  OpportunityDetails opportunityDetails;
  OppourtinityDataDetailsSuccess({
    required this.opportunityDetails
});
}
class OppourtinityDataDetailsFailed extends OppourtunityDataDetailsState
{

  String? errMsg;
  OppourtinityDataDetailsFailed({
    required this.errMsg
  });
}


class OppourtinityDataDetailsLoading extends OppourtunityDataDetailsState
{

}


//OppourtinityDataDetails
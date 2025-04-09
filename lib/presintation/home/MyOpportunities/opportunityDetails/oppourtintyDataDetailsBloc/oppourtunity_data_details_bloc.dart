import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/model/opportunity/OpportunityDetails.dart';
import '../../../../../infrastructure/repository/opportunityRepo/opportunityRepo.dart';

part 'oppourtunity_data_details_event.dart';
part 'oppourtunity_data_details_state.dart';

class OppourtunityDataDetailsBloc extends Bloc<OppourtunityDataDetailsEvent, OppourtunityDataDetailsState> {
  OpportunityRepo oppourtunityRepo;
  OppourtunityDataDetailsBloc({required this.oppourtunityRepo}) : super(OppourtunityDataDetailsInitial()) {
    on<OppourtunityDataDetailsEvent>((event, emit) async{

      if(event is OppourtinityDataDetailsEvents)
        {


          var res =await oppourtunityRepo.myOpportunityDetails(event.id!);
         res
             .fold((e) => emit(OppourtinityDataDetailsFailed(errMsg: e.toString())),(r)=>emit(OppourtinityDataDetailsSuccess( opportunityDetails: r)));
        }
    });
  }
}

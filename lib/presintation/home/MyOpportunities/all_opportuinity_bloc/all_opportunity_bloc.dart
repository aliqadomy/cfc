import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/opportunity/all_opportunity_model.dart';
import '../../../../infrastructure/repository/opportunityRepo/opportunityRepo.dart';

part 'all_opportunity_event.dart';
part 'all_opportunity_state.dart';

class AllOpportunityBloc
    extends Bloc<AllOpportunityEvent, AllOpportunityState> {
  OpportunityRepo opportunityRepo;
  AllOpportunityBloc({required this.opportunityRepo})
      : super(AllOpportunityInitial()) {
    on<AllOpportunityEvent>((event, emit) async {
      if(event is AllOpportuintyEvents)
        {
          emit(AllOpportunityLoading());
          var res = await opportunityRepo.allOpportunity();
          print("ffffeeee $res");
          res
              .fold((e) => emit(AllOpportunityFailed(errMsg: e.toString())),(r)=>emit(AllOpportunitySuccess(allOpportunityModel: r)));
        }
    });
  }
}

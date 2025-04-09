import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/nearestDateModel.dart';
import '../../../../infrastructure/repository/DashBoardRepo.dart';

part 'nearest_date_event.dart';
part 'nearest_date_state.dart';

class NearestDateBloc extends Bloc<NearestDateEvent, NearestDateState> {
  DashboardRepo dashboardRepo;
  NearestDateBloc({required this.dashboardRepo}) : super(NearestDateInitial()) {
    on<NearestDateEvent>((event, emit)async {
      if (event is NearestDateEvents) {
        var response = await dashboardRepo.nearestDate();

        response
            .fold((e) => emit(NearestDateFailed(errMsg: e.toString())),(r)=>emit(NearestDateSuccess(nearestDateModel: r)));
      }
    });
  }
}

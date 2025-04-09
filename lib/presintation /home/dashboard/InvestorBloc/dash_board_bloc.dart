import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/AccountNumberModel.dart';
import 'package:cfc_main/domain/model/InvestorDashBoardModel.dart';
import 'package:meta/meta.dart';

import '../../../../infrastructure/repository/DashBoardRepo.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashboardRepo dashboardRepo;
  DashBoardBloc({required this.dashboardRepo}) : super(DashBoardInitial()) {
    on<DashBoardEvent>((event, emit) async {
      if (event is investordashboardEvent) {
        var response = await dashboardRepo.investorDashBoard();
        response
            .fold((e) => emit(InvestordashboardFailed(errMsg: e.toString())),(r)=>emit(InvestordashboardSuccess(investorDashBoardModel: r)));
      }
    });
  }
}

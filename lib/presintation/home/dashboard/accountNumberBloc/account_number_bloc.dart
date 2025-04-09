import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/model/AccountNumberModel.dart';
import '../../../../infrastructure/repository/DashBoardRepo.dart';

part 'account_number_event.dart';
part 'account_number_state.dart';

class AccountNumberBloc extends Bloc<AccountNumberEvent, AccountNumberState> {
  DashboardRepo dashboardRepo;
  AccountNumberBloc({required this.dashboardRepo}) : super(AccountNumberInitial()) {
    on<AccountNumberEvent>((event, emit) async{
      if(event is accountNumberEvent)
      {
        var response = await dashboardRepo.accountNumber();
        response
            .fold((e) => emit(AccountNumberFailed(errMsg: e.toString())),(r)=>emit(AccountNumberSuccess(accountNumberModel: r)));
      }
    });
  }
}

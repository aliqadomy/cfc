import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/model/wallet/finicialStatmentModel.dart';
import '../../../../infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';

part 'finicial_statment_event.dart';
part 'finicial_statment_state.dart';

class FinicialStatmentBloc extends Bloc<FinicialStatmentEvent, FinicialStatmentState> {
  MyWalletRepo myWalletRepo;
  FinicialStatmentBloc({required this.myWalletRepo}) : super(FinicialStatmentInitial()) {
    on<FinicialStatmentEvent>((event, emit)async {

      if(event is FinicalStatemtEvents)
        {
          var response =await myWalletRepo.finicialStatment(event.role_type);
          emit(FinicalStatmentLoading());
          response.fold((e)=>emit(FinicalStatmentFailed(errMsg: e.toString())), (s)=>emit(FinicalStatmentSuccess( walletData: s)));

        }
    });
  }
}

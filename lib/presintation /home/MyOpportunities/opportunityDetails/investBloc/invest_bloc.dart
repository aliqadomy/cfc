import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';

part 'invest_event.dart';
part 'invest_state.dart';

class InvestBloc extends Bloc<InvestEvent, InvestState> {
  MyWalletRepo myWalletRepo;
  InvestBloc({required this.myWalletRepo}) : super(InvestInitial()) {
    on<InvestEvent>((event, emit) async{
      if(event is InvestEvents)
        {
          var res =await myWalletRepo.invest(event.amount!, "0",event.campaign!);
          emit(InvestLoading());
          res
              .fold((e) => emit(InvestFailed(msg: e.toString(),isLoading: false)),(r)=>emit(InvestSuccessful(msg: r.toString(),isLoading: false)));

        }
    });
  }
}

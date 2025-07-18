import 'dart:async';
import 'package:cfc_main/domain/model/wallet/WalletResponseModel.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  MyWalletRepo myWalletRepo;
  BalanceBloc({required this.myWalletRepo}) : super(BalanceInitial()) {
    on<BalanceEvent>((event, emit) async {
      if (event is BalanceGet) {
        var res = await myWalletRepo.walletBalance();
        res.fold((e) => emit(BalanceFailed(errMsg: e.toString())),
            (s) => emit(BalanceSuccess(walletResponse: s)));
      } else if (event is getTotalOppoByid) {
        var res = await myWalletRepo.totalInvestmentInOpportunityById(event.id);
        res.fold((e) => emit(TotlaBalanceFailed(errMsg: e.toString())),
            (s) => emit(TotlaBalanceSuccess(total: s.totalInvestment!)));
      }
    });
  }
}

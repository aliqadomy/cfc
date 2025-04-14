import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/wallet/banks.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../domain/model/wallet/UserKycModel.dart';
import '../../../../domain/model/wallet/WithDrawBalance.dart';
import '../../../../infrastructure/repository/my_wallet_repo/InvestResponse.dart';
import '../../../../infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  MyWalletRepo myWalletRepo;
  WithdrawBloc({required this.myWalletRepo}) : super(WithdrawInitial()) {
    on<WithdrawEvent>((event, emit) async {
      if (event is WithdrawEvents) {
        var response = await myWalletRepo.userKyc();

        response.fold(
            (e) => emit(UserKycStateFaield(errMsg: e.toString())),
            (s) {
              final value = s.infoType?[1].detail?[1].value;

              if (value == null) {
                emit(UserKycStateFaield(errMsg: "There is no account bank"));
                return; // Prevent further execution
              }
              emit(

                  UserKycStateSuccess(
                  userKyc: s,
                  bic: Banks.getBankAtIndex(
                      int.parse(s.infoType?[1].detail?[1].value ?? ""))));
            });
      } else if (event is WithdrawBalance) {
        var response = await myWalletRepo.paymentWithdraw(
            event.amount, event.creditAccount, event.bic);
        response.fold(
            (e) => emit(WithdrawBalanceStateFaield(errMsg: e.toString())),
            (s) => emit(WithdrawBalanceStateSuccess(withDrawBalance: s)));
      }
    });
  }
}

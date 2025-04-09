part of 'withdraw_bloc.dart';

@immutable
abstract class WithdrawState {}

class WithdrawInitial extends WithdrawState {}

class UserKycStateSuccess extends WithdrawState{
  UserKycModel userKyc;
  String bic;
  UserKycStateSuccess({required this.userKyc,required this.bic});
}

class UserKycStateLoading extends WithdrawState{}

class UserKycStateFaield extends WithdrawState{
  String?errMsg;
  UserKycStateFaield({required this.errMsg});
}


class WithdrawBalanceStateSuccess extends WithdrawState{
  WithDrawBalance withDrawBalance;
  WithdrawBalanceStateSuccess({required this.withDrawBalance});
}

class WithdrawBalanceStateLoading extends WithdrawState{}

class WithdrawBalanceStateFaield extends WithdrawState{
  String?errMsg;
  WithdrawBalanceStateFaield({required this.errMsg});
}
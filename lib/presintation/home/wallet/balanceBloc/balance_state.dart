part of 'balance_bloc.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class BalanceSuccess extends BalanceState{
  WalletResponseModel walletResponse;
  BalanceSuccess({required this.walletResponse});
}
class BalanceFailed extends BalanceState{
  String errMsg;
  BalanceFailed({required this.errMsg});
}
class BalanceLoading extends BalanceState{}

class TotlaBalanceSuccess extends BalanceState{
  double total;
  TotlaBalanceSuccess({required this.total});
}
class TotlaBalanceFailed extends BalanceState{
  String errMsg;
  TotlaBalanceFailed({required this.errMsg});
}
class TotlaBalanceLoading extends BalanceState{}
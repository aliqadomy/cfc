part of 'withdraw_bloc.dart';

@immutable
abstract class WithdrawEvent {}

class WithdrawEvents extends WithdrawEvent{}
class WithdrawBalance extends WithdrawEvent{
  String amount;
  String creditAccount;
  String bic;
  WithdrawBalance({required this.amount, required this.creditAccount, required this.bic});
}

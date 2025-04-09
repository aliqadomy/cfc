part of 'account_number_bloc.dart';

@immutable
abstract class AccountNumberState {}

class AccountNumberInitial extends AccountNumberState {}
class AccountNumberSuccess extends AccountNumberState{
  AccountNumberModel accountNumberModel;
  AccountNumberSuccess({required this.accountNumberModel});
}
class AccountNumberFailed extends AccountNumberState{
  String errMsg;
  AccountNumberFailed({required this.errMsg});
}
class AccountNumberLoading extends AccountNumberState{}
part of 'finicial_statment_bloc.dart';

@immutable
abstract class FinicialStatmentState {}

class FinicialStatmentInitial extends FinicialStatmentState {}

class FinicalStatmentSuccess extends FinicialStatmentState{
  List<WalletData> walletData;
  FinicalStatmentSuccess({required this.walletData});
}
class FinicalStatmentFailed extends FinicialStatmentState{
  String errMsg;
  FinicalStatmentFailed({required this.errMsg});
}
class FinicalStatmentLoading extends FinicialStatmentState{}

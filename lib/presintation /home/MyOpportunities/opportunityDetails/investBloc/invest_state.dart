part of 'invest_bloc.dart';

@immutable
abstract class InvestState {}

class InvestInitial extends InvestState {}

class InvestSuccessful extends InvestState{
  String? msg;
  bool isLoading;

  InvestSuccessful({required this.msg,required this.isLoading});
}

class InvestFailed extends InvestState{
  String? msg;
  bool isLoading;
  InvestFailed({required this.msg,required this.isLoading});
}
class InvestLoading extends InvestState{

  InvestLoading();
}
part of 'balance_bloc.dart';

@immutable
abstract class BalanceEvent {}

class BalanceGet extends BalanceEvent{}

class getTotalOppoByid extends BalanceEvent{
  int id ;
  getTotalOppoByid({required this.id});
}



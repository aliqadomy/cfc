part of 'pay_one_bloc.dart';

@immutable
abstract class PayOneEvent {}

class AddBalance extends PayOneEvent{
  int amount;
  AddBalance({required this.amount});
}
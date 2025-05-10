part of 'pay_one_bloc.dart';

@immutable
abstract class PayOneEvent {}

class AddBalance extends PayOneEvent{
  String amount;
  AddBalance({required this.amount});
}
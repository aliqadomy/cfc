part of 'invest_bloc.dart';

@immutable
abstract class InvestEvent {}
class InvestEvents extends InvestEvent{
  String? amount;
  String? invester;
  String? campaign;
  InvestEvents({required this.amount,required this.campaign});
}
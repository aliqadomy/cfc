part of 'finicial_statment_bloc.dart';

@immutable
abstract class FinicialStatmentEvent {}
class FinicalStatemtEvents extends FinicialStatmentEvent{
  int role_type;
  FinicalStatemtEvents({required this.role_type});

}
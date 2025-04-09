part of 'me_bloc.dart';

@immutable
abstract class MeState {}

class MeInitial extends MeState {}

class MeSuccess extends MeState {
  MeModel? user;
  MeSuccess({required this.user});
}

class MeFailed extends MeState {
  String? errMsg;
  MeFailed({this.errMsg});
}

class MeLoading extends MeState {}

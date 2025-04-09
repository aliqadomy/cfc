part of 'watheq_bloc.dart';

@immutable
abstract class WatheqState {}

class WatheqInitial extends WatheqState {}

class WatheqStateSuccess extends WatheqState{
  WatheqModel? watheqModel;
  WatheqStateSuccess({required this.watheqModel});
}

class WatheqStateFailed extends WatheqState{
  String? errMsg;
  WatheqStateFailed({required this.errMsg});
}

class WatheqStateLoading extends WatheqState{}
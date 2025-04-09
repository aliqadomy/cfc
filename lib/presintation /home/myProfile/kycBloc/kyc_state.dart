part of 'kyc_bloc.dart';

@immutable
abstract class KycState {}

class KycInitial extends KycState {}

class KycStateSuccess extends KycState{
  List<ShowKyc> list=[];
      KycStateSuccess({required this.list});
}
class KycStateFailed extends KycState{
  String msg;
  KycStateFailed({required this.msg});
}
class KycStateLoading extends KycState{}
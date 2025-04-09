part of 'modefiy_kyc_bloc.dart';

@immutable
abstract class ModefiyKycState {}

class ModefiyKycInitial extends ModefiyKycState {}
class ModefiyKycSuccess extends ModefiyKycState{
  ModefiyKyc modefiyKyc;
  ModefiyKycSuccess({required this.modefiyKyc});
}
class ModefiyKycFailed extends ModefiyKycState{
  String errMsg;
  ModefiyKycFailed({required this.errMsg});

}
class ModefiyKycLoading extends ModefiyKycState{}

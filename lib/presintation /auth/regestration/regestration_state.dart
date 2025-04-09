part of 'regestration_bloc.dart';

@immutable
abstract class RegestrationState {}

class RegestrationInitial extends RegestrationState {}


class RegestrationBorrowerSuccess extends RegestrationState {
  ResponseRegister responseRegister;
  RegestrationBorrowerSuccess({required this.responseRegister});
}
class RegestrationBorrowerFailed extends RegestrationState {
  String? errMsg;
  RegestrationBorrowerFailed({required this.errMsg});
}
class RegestrationBorrowerLoading extends RegestrationState {}


class RegestrationInvestorSuccess extends RegestrationState {
  ResponseRegister responseRegister;
  RegestrationInvestorSuccess({required this.responseRegister});
}
class RegestrationInvestorFailed extends RegestrationState {
  String? errMsg;
  RegestrationInvestorFailed({required this.errMsg});
}
class RegestrationInvestorLoading extends RegestrationState {}


class RegestrationTermsSuccess extends RegestrationState {
  String message;
  RegestrationTermsSuccess({required this.message});
}
class RegestrationTermsFailed extends RegestrationState {
  String? errMsg;
  RegestrationTermsFailed({required this.errMsg});
}
class RegestrationTermsLoading extends RegestrationState {}
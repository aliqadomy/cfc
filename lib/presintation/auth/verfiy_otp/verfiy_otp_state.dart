part of 'verfiy_otp_bloc.dart';

@immutable
abstract class VerfiyOtpState {}

class VerfiyOtpInitial extends VerfiyOtpState {}

class SendOtpSuccess extends VerfiyOtpState{
  SendOtpModel msg;
  SendOtpSuccess({required this.msg});
}
class SendOtpFailed extends VerfiyOtpState{
  String msg;
  SendOtpFailed({required this.msg});
}
class SendOtpLoading extends VerfiyOtpState{}


class VerifyOtpSuccess extends VerfiyOtpState{
  SendOtpModel msg;
  VerifyOtpSuccess({required this.msg});
}
class VerifyOtpFailed extends VerfiyOtpState{
  String msg;
  VerifyOtpFailed({required this.msg});
}
class VerifyOtpLoading extends VerfiyOtpState{}

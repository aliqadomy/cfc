part of 'verfiy_otp_bloc.dart';

@immutable
abstract class VerfiyOtpEvent {}

class SendOtp extends VerfiyOtpEvent{
  String email;
  SendOtp({required this.email});
}

class VerifyOtp extends VerfiyOtpEvent{
  String email;
  String otp;
  VerifyOtp({required this.email,required this.otp});
}

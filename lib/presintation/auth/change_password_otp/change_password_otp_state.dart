part of 'change_password_otp_bloc.dart';

@immutable
abstract class ChangePasswordOtpState {}

class ChangePasswordOtpInitial extends ChangePasswordOtpState {}

class ChangePasswordOtpSuccess extends ChangePasswordOtpState{
  String msg;

  ChangePasswordOtpSuccess({required this.msg});
}

class ChangePasswordOtpFailed extends ChangePasswordOtpState{
  String msg;
  ChangePasswordOtpFailed({required this.msg});
}
class ChangePasswordOtpLoading extends ChangePasswordOtpState{

}

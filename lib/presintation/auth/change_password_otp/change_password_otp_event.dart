part of 'change_password_otp_bloc.dart';

@immutable
abstract class ChangePasswordOtpEvent {}

class ChangePasswordOtpEvents extends ChangePasswordOtpEvent{
  String email;
  String password;
  String confirmPassword;
  ChangePasswordOtpEvents({required this.email,required this.password,required this.confirmPassword});
}

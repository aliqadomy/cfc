part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginWithCredentials extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentials({required this.email, required this.password});
}

class LoginWithRefreshToken extends LoginEvent {
  final String refreshToken;

  LoginWithRefreshToken({required this.refreshToken});
}

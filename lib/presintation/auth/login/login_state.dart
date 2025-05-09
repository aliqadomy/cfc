part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}
class NewTokenLoading extends LoginState {}

abstract class LoginSuccessBase extends LoginState {
  final ResponseUser responseUser;
  LoginSuccessBase({required this.responseUser});
}

class LoginSuccess extends LoginSuccessBase {
  LoginSuccess({required super.responseUser});
}

class NewTokenSuccess extends LoginSuccessBase {
  NewTokenSuccess({required super.responseUser});
}

abstract class LoginFailedBase extends LoginState {
  final String msgErr;
  LoginFailedBase({required this.msgErr});
}

class LoginFailed extends LoginFailedBase {
  LoginFailed({required super.msgErr});
}

class NewTokenFailed extends LoginFailedBase {
  NewTokenFailed({required super.msgErr});
}

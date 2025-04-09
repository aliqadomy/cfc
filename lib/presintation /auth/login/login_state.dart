part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState{
  ResponseUser responseUser;
  LoginSuccess({required this.responseUser});
}
class LoginFailed extends LoginState{
  String msgErr;
  LoginFailed({required this.msgErr});
}
class LoginLoading extends LoginState{}

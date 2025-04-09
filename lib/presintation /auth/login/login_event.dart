part of 'login_bloc.dart';
abstract class LoginEvent {}

class LoginEvents extends LoginEvent{
  String email;
  String  password;

  LoginEvents({required this.email,required this.password});
}

part of 'change_password_bloc.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordSuccess extends ChangePasswordState {
  String successMsg;
  ChangePasswordSuccess({required this.successMsg});
}
class ChangePasswordLoading extends ChangePasswordState {}
class ChangePasswordFailed extends ChangePasswordState {
  String errMsg;
  ChangePasswordFailed({required this.errMsg});
}
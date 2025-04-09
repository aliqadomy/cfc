part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {}
 class ChangePasswordEvents extends ChangePasswordEvent {
   String oldPass;
  String newPass;
   ChangePasswordEvents({required this.oldPass,required this.newPass});
 }
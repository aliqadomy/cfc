part of 'regestration_bloc.dart';

abstract class RegestrationEvent {}

class ResgestrationBorrowerEvent extends RegestrationEvent {
  ResgestrationBorrowerEvent({required this.email,required this.username,required this.name,required this.password,required this.role_type,required this.country_code,required this.mobile_number, required this.registration_type});
  String email;
  String password;
  String name;
  String username;
  String mobile_number;
  String country_code;
  String role_type;
  String registration_type;
}

class ResgestrationInvestorEvent extends RegestrationEvent {
  ResgestrationInvestorEvent({required this.email,required this.username,required this.name,required this.password,required this.role_type,required this.country_code,required this.mobile_number, required this.registration_type});
  String email;
  String password;
  String name;
  String username;
  String mobile_number;
  String country_code;
  String role_type;
  String registration_type;
}

class ResgestrationTermsEvent extends RegestrationEvent {
  ResgestrationTermsEvent();

}

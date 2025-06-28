part of 'pay_one_bloc.dart';

@immutable
abstract class PayOneState {}

class PayOneInitial extends PayOneState {}

class PayOneSuccess extends PayOneState {
  PaymentGetWayModel paymentGetWayModel;
  PayOneSuccess({required this.paymentGetWayModel});
}
class PayOneFailed extends PayOneState {
  String msg;
  PayOneFailed({required this.msg});
}
class PayOneLoading extends PayOneState {}
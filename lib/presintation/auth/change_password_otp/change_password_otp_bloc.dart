import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../infrastructure/repository/ResetPassRepo.dart';

part 'change_password_otp_event.dart';
part 'change_password_otp_state.dart';

class ChangePasswordOtpBloc extends Bloc<ChangePasswordOtpEvent, ChangePasswordOtpState> {
  final ResetPassRepo resetPassRepo;

  ChangePasswordOtpBloc({required this.resetPassRepo}) : super(ChangePasswordOtpInitial()) {
    on<ChangePasswordOtpEvent>((event, emit) async{
      if(event is ChangePasswordOtpEvents)
        {
          emit(ChangePasswordOtpLoading());
          var res =await resetPassRepo.changePasswordOtp(event.email, event.password, event.confirmPassword);
          res.fold((err)=>emit(ChangePasswordOtpFailed(msg: err.toString())), (s)=>emit(ChangePasswordOtpSuccess(msg: s.toString())));


        }
    });
  }
}

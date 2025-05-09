import 'dart:async';

import 'package:cfc_main/domain/model/SendOtpModel.dart';
import 'package:cfc_main/infrastructure/repository/otpRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verfiy_otp_event.dart';
part 'verfiy_otp_state.dart';

class VerfiyOtpBloc extends Bloc<VerfiyOtpEvent, VerfiyOtpState> {
  SendOtpRepo sendOtpRepo;
  VerfiyOtpBloc({required this.sendOtpRepo}) : super(VerfiyOtpInitial()) {
    on<VerfiyOtpEvent>((event, emit)async {
      if(event is SendOtp)
        {
          emit(SendOtpLoading());
          var res=await sendOtpRepo.sendOtpRepFun(event.email);

          res.fold(
                (error) {
              emit(SendOtpFailed(msg: error.message));
            },
                (s) {
              emit(SendOtpSuccess(msg: s));
            },
          );
        }else if(event is VerifyOtp)
      {
        emit(VerifyOtpLoading());
        var res=await sendOtpRepo.verfiyOtpRepFun(event.email,event.otp);

        res.fold(
              (error) {
            emit(VerifyOtpFailed(msg: error.message));
          },
              (s) {
            emit(VerifyOtpSuccess(msg: s));
          },
        );
      }
    });
  }
}

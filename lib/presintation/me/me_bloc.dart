import 'dart:async';

import 'package:cfc_main/domain/model/MeModel.dart';
import 'package:cfc_main/domain/model/Response.dart';
import 'package:cfc_main/infrastructure/data_soruce/auth/LoginAuthProvider.dart';
import 'package:cfc_main/infrastructure/repository/loginRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'me_event.dart';
part 'me_state.dart';

class MeBloc extends Bloc<MeEvent, MeState> {
  LoginRepo? loginRepo;

  MeBloc({required this.loginRepo}) : super(MeInitial()) {
    on<MeEvent>((event, emit) async {
      if(event is MeEvents){

        var res= await loginRepo?.me();

        res?.fold((e)=>emit(MeFailed(errMsg: e.toString())),(s)=>emit(MeSuccess(user: s)));
      }
    });
  }
}

import 'dart:async';

import 'package:cfc_main/domain/model/kyc/ShowKyc.dart';
import 'package:cfc_main/infrastructure/repository/kyc/KycRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycRepo kycRepo;

  KycBloc({required this.kycRepo}) : super(KycInitial()){
    on<KycEvent>((event, emit) async{
      var res =await kycRepo.showUserKyc();
      print("hamza ---------- $res");
      emit(KycStateLoading());
      res
          .fold((e) => emit(KycStateFailed(msg: e.toString())),(r)=>emit(KycStateSuccess(list: r)));

    });
  }
}

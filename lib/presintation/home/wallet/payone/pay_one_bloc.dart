import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/wallet/paymentGetWayModel.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/appException.dart';
import '../../../../infrastructure/data_soruce/my_wallet/myWalletProvider.dart';

part 'pay_one_event.dart';
part 'pay_one_state.dart';

class PayOneBloc extends Bloc<PayOneEvent, PayOneState> {
  MyWalletRepo myWalletRepo;
  PayOneBloc({required this.myWalletRepo}) : super(PayOneInitial()) {
    on<PayOneEvent>((event, emit)async {
      if(event is AddBalance)
        {
          emit(PayOneLoading());
          var res = await myWalletRepo.addBalance(event.amount);
          print(res);
          res.fold((e)=>emit(PayOneFailed( msg: e.toString())), (s)=>emit(PayOneSuccess(paymentGetWayModel: s)));
        }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/appException.dart';
import '../../../../infrastructure/data_soruce/my_wallet/myWalletProvider.dart';

part 'pay_one_event.dart';
part 'pay_one_state.dart';

class PayOneBloc extends Bloc<PayOneEvent, PayOneState> {
  Mywalletprovider myWalletprovider;
  PayOneBloc({required this.myWalletprovider}) : super(PayOneInitial()) {
    on<PayOneEvent>((event, emit)async {
      if(event is AddBalance)
        {
          await myWalletprovider.addBalance(event.amount);

        }
    });
  }
}

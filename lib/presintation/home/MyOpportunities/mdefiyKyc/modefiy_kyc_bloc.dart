import 'dart:core';
import 'package:cfc_main/domain/model/kyc/ShowKyc.dart';
import 'package:cfc_main/domain/model/opportunity/ModefiyKyc.dart';
import 'package:cfc_main/infrastructure/repository/opportunityRepo/opportunityRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'modefiy_kyc_event.dart';
part 'modefiy_kyc_state.dart';

class ModefiyKycBloc extends Bloc<ModefiyKycEvent, ModefiyKycState> {
  OpportunityRepo opportunityRepo;
  ModefiyKycBloc({required this.opportunityRepo}): super(ModefiyKycInitial()) {
    on<ModefiyKycEvent>((event, emit) async {
      print("sssweeeeee ${event}");
      if (event is ModefiyKycEvents) {

        var res = await opportunityRepo.modefiyKycRepo(
            event.email,
            event.mobileNumber,
            event.matiralStatus,
            event.familyNumber,
            event.gender,
            event.education,
            event.region,
            event.jobStatus,
            event.nationalityLocation,
            event.identityType,
            event.nationality,
            event.bank,
            event.date,
            event.idNumber,
            event.iban,
            event.income,
            event.one,
            event.two,
            event.three,
            event.four,
            event.five,
            event.six,
            event.seven,
            event.eight,
            event.wkaleh,
            event.selectedAnswer,
            event.arabicName,
            event.englishName);

        res.fold((e) => emit(ModefiyKycFailed(errMsg: e.toString())),
            (r) => emit(ModefiyKycSuccess(modefiyKyc: r)));
      }else if (event is ShowModefiyKycEvent) {
        var res = await opportunityRepo.showKyc();
        res.fold((e) => emit(ShowKycFailed(errMsg: e.toString())),
                (r) => emit(ShowKycSuccess(showKyc: r)));
      }
    });
  }
}

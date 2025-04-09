import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/WatheqModel.dart';
import 'package:cfc_main/infrastructure/repository/WatheqRepo.dart';
import 'package:cfc_main/infrastructure/repository/opportunityRepo/opportunityRepo.dart';
import 'package:meta/meta.dart';

part 'watheq_event.dart';
part 'watheq_state.dart';

class WatheqBloc extends Bloc<WatheqEvent, WatheqState> {
  WatheqRepo watheqRepo;
  WatheqBloc({required this.watheqRepo}) : super(WatheqInitial()) {
    on<WatheqEvent>((event, emit)async {
      if(event is WatheqIqama){
        emit(WatheqStateLoading());
        var res = await watheqRepo.watheqIqamaReop(event.iqama, event.date);
        res.fold(
              (error) {
            emit(WatheqStateFailed(errMsg: error.message));
          },
              (res) {
            emit(WatheqStateSuccess(watheqModel:res));
          },
        );
      }else if(event is WatheqSaudi){
        emit(WatheqStateLoading());
        var res = await watheqRepo.watheqIqamaReop(event.iqama, event.date);
        print(res);
        res.fold(
              (error) {
            emit(WatheqStateFailed(errMsg: error.message));
          },
              (res) {
            emit(WatheqStateSuccess(watheqModel:res));
          },
        );
      }
    });
  }
}

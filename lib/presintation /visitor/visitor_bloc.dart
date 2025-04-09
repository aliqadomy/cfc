import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/VisitorModel.dart';
import 'package:cfc_main/domain/model/VisitorResponse.dart';
import 'package:meta/meta.dart';

import '../../infrastructure/repository/visitorRepo.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  VisitorRepo visitorRepo;

  VisitorBloc({required this.visitorRepo}) : super(VisitorInitial()) {
    on<VisitorEvent>((event, emit) async{
      if (event is VisitorEvents) {
        var res = await visitorRepo.visitor();
        res.fold(
              (error) {
            emit(VisitorFailed(errMsg: error.message));
          },
              (data) {
               var one= data.where((i)=> i.type==1).toList();
               var two= data.where((i)=> i.type==2).toList();
               var three= data.where((i)=> i.type==3).toList();
               var four= data.where((i)=> i.type==4).toList();
               emit(VisitorSuccess(typeOne: one, typeTwo: two, typeThree: three,typeFour: four));
          },
        );
      }
    });

  }
}

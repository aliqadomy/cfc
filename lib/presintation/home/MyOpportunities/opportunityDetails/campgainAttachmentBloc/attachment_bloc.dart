import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/model/opportunity/Attachment.dart';
import '../../../../../infrastructure/repository/opportunityRepo/opportunityRepo.dart';

part 'attachment_event.dart';
part 'attachment_state.dart';

class AttachmentBloc extends Bloc<AttachmentEvent, AttachmentState> {
  OpportunityRepo opportunityRepo;
  AttachmentBloc({required this.opportunityRepo}) : super(AttachmentInitial()) {
    on<AttachmentEvent>((event, emit) async{
      if(event is OpportunityAttachmentsEvent)
      {
        emit(AttachmentLoading());
        var res = await opportunityRepo.myOpportunityAttachment(event.id!);
        res
            .fold((e) => emit(AttachmentFailed(errMsg: e.toString())),(r)=>emit(AttachmentSuccess(list: r)));
      }
    });
  }
}

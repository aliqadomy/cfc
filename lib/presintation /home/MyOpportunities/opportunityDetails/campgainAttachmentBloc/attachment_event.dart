part of 'attachment_bloc.dart';

@immutable
abstract class AttachmentEvent {}

class OpportunityAttachmentsEvent extends AttachmentEvent{
   int? id;
   OpportunityAttachmentsEvent({required this.id});
}

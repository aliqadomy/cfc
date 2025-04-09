part of 'attachment_bloc.dart';

@immutable
abstract class AttachmentState {}

class AttachmentInitial extends AttachmentState {}

class AttachmentSuccess extends AttachmentState{
  List<Attachment> list=<Attachment>[];
  AttachmentSuccess({required this.list});
}
class AttachmentFailed extends AttachmentState{
  String errMsg;
  AttachmentFailed({required this.errMsg});
}
class AttachmentLoading extends AttachmentState{}


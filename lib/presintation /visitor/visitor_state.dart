part of 'visitor_bloc.dart';

@immutable
abstract class VisitorState {}

class VisitorInitial extends VisitorState {}

class VisitorSuccess extends VisitorState{
  List<VisitorResponse> typeOne=[];
  List<VisitorResponse> typeTwo=[];
  List<VisitorResponse> typeThree=[];
  List<VisitorResponse> typeFour=[];
  VisitorSuccess({required this.typeOne,required this.typeTwo,required this.typeThree,required this.typeFour});
}

class VisitorFailed extends VisitorState{
  VisitorFailed({required this.errMsg});
  String errMsg;
}

class VisitorLoading extends VisitorState{}
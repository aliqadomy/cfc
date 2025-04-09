part of 'nearest_date_bloc.dart';

@immutable
abstract class NearestDateState {}

class NearestDateInitial extends NearestDateState {}

class NearestDateSuccess extends NearestDateState{
  NearestDateModel nearestDateModel;
  NearestDateSuccess({required this.nearestDateModel});
}
class NearestDateFailed extends NearestDateState{
  String errMsg;
  NearestDateFailed({required this.errMsg});
}
class NearestDateLoading extends NearestDateState{}

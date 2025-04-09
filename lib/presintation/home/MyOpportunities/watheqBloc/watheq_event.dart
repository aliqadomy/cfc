part of 'watheq_bloc.dart';

@immutable
abstract class WatheqEvent {}

class WatheqIqama extends WatheqEvent{
  String date;
  String iqama;
  WatheqIqama({required this.date,required this.iqama});
}

class WatheqSaudi extends WatheqEvent{
  String date;
  String iqama;
  WatheqSaudi({required this.date,required this.iqama});
}

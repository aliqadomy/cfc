part of 'dash_board_bloc.dart';

@immutable
abstract class DashBoardState {}

class DashBoardInitial extends DashBoardState {}

class InvestordashboardSuccess extends DashBoardState{
  InvestorDashBoardModel investorDashBoardModel;
  InvestordashboardSuccess({required this.investorDashBoardModel});

}
class InvestordashboardFailed extends DashBoardState{
  String errMsg;
  InvestordashboardFailed({required this.errMsg});
}
class InvestordashboardLoading extends DashBoardState{}




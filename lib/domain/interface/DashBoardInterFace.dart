
import 'package:cfc_main/domain/model/AccountNumberModel.dart';
import 'package:cfc_main/domain/model/InvestorDashBoardModel.dart';
import 'package:dartz/dartz.dart';
import '../model/nearestDateModel.dart';

abstract class Dashboardinterface{
  Future<Either<dynamic,InvestorDashBoardModel>> investorDashBoard();
  Future<Either<dynamic,AccountNumberModel>> accountNumber();
  Future<Either<dynamic,NearestDateModel>> nearestDate();
}
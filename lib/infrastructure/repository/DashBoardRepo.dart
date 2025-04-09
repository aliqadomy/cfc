import 'package:cfc_main/domain/interface/DashBoardInterFace.dart';
import 'package:cfc_main/domain/model/AccountNumberModel.dart';
import 'package:cfc_main/domain/model/InvestorDashBoardModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/appException.dart';
import '../../domain/model/nearestDateModel.dart';
import '../data_soruce/mainHome/mainHomeProvider.dart';

class DashboardRepo extends Dashboardinterface
{
  MainHomeProvider mainHomeProvider;
  DashboardRepo({required this.mainHomeProvider});
  @override
  Future<Either<dynamic, AccountNumberModel>> accountNumber() async{
    try {
      final response = await mainHomeProvider.accountNumberData();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }
      final accountNumber = AccountNumberModel.fromJson(response.data['response']);
      return Right(accountNumber);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      // Catch all other exceptions and return an AppException
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, InvestorDashBoardModel>> investorDashBoard()async {

    try {
      final response = await mainHomeProvider.investorDashBoardData();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }

      final investorDashboard = InvestorDashBoardModel.fromJson(response.data['response']['data']);

      return Right(investorDashboard);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      // Catch all other exceptions and return an AppException
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, NearestDateModel>> nearestDate() async{
    try {
      final response = await mainHomeProvider.nearestDateData();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final nearestDate = NearestDateModel.fromJson(response.data['response']['message']);
      return Right(nearestDate);

    } on DioException catch (e) {
      print("hereee now ${e.message}");

      return Left(AppException.fromDioError(e));
    } catch (error) {
      print("hereee nowsss ${error}");

      return Left(AppException(error.toString()));
    }
  }
}
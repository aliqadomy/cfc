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
  Future<Either<dynamic, NearestDateModel>> nearestDate() async {
    try {
      final response = await mainHomeProvider.nearestDateData();
      print("Response: $response");

      if (response.data != null && response.data['status'] == false) {
        return Left(AppException(response.data['response']?['message'] ?? 'Unknown error occurred'));
      }

      var message = response.data['response']?['message'];
      if (message == null) {
        return Left(AppException('No future date found.'));
      }

      // Parse the nearest date model from the response message
      final nearestDate = NearestDateModel.fromJson(message);
      return Right(nearestDate);

    } on DioException catch (e) {
      print("DioException: ${e.message}");

      if (e.response != null) {
        print("Error response: ${e.response?.data}");
      }
      print("DioException: ${e.message}");
      return Left(AppException.fromDioError(e));
    } catch (error) {
      print("Error: $error");
      return Left(AppException(error.toString()));
    }
  }

}
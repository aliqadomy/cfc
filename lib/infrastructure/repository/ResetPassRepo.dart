import 'package:cfc_main/infrastructure/data_soruce/auth/resetPassword.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/appException.dart';

class ResetPassRepo {
  late final ResetAuth resetAuth;
  ResetPassRepo({required this.resetAuth});

  Future<Either<dynamic, dynamic>> changePassword(int id, String oldPass, String newPass)async {
    final response = await resetAuth.changePassword(id, oldPass, newPass);
    try {
      if (response.data == false) {
        return Left(AppException(response.data ?? 'Unknown error occurred'));
      }
      if(response.data['status']!=false)
        {
          final responseUser = response.data['response'];
          return Right(responseUser);
        }
      return Left(response.data['response']);


    } on DioException catch (e) {

      return Left(AppException.fromDioError(e));
    } catch (error) {

      return Left(AppException(error.toString()));
    }
  }

  Future<Either<dynamic, dynamic>> changePasswordOtp(String email, String password, String confirmPassword)async {
    final response = await resetAuth.changePasswordOtp(email, password, confirmPassword);
    try {
      if (response.data == false) {
        return Left(AppException(response.data ?? 'Unknown error occurred'));
      }
      if(response.data['status']!=false)
      {
        final responseUser = response.data['response'];
        return Right(responseUser);
      }
      return Left(response.data['response']);


    } on DioException catch (e) {

      return Left(AppException.fromDioError(e));
    } catch (error) {

      return Left(AppException(error.toString()));
    }
  }
}
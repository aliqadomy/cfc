import 'package:cfc_main/domain/interface/otpInterFace.dart';
import 'package:cfc_main/domain/model/MeModel.dart';
import 'package:cfc_main/domain/model/SendOtpModel.dart';
import 'package:cfc_main/infrastructure/data_soruce/auth/otpProvider.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/appException.dart';
import '../../domain/interface/loginInterFace.dart';



class SendOtpRepo extends OtpInterFace {
  final OtpProvider otpProvider;

  SendOtpRepo({required this.otpProvider});

  @override
  Future<Either<dynamic, SendOtpModel>> sendOtpRepFun(String email) async{
    try {
      final response = await otpProvider.sendOtpProFun(email);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final otpResponse = SendOtpModel.fromJson(response.data['response']);

      return Right(otpResponse);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, SendOtpModel>> verfiyOtpRepFun(String email,String otp) async{
    try {
      final response = await otpProvider.verfiyOtpFun(email,otp);

      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final otpResponse = SendOtpModel.fromJson(response.data['response']);

      return Right(otpResponse);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
}

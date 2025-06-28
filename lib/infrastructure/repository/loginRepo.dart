import 'package:cfc_main/domain/model/MeModel.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/appException.dart';
import '../../domain/interface/loginInterFace.dart';
import '../../domain/model/Response.dart';
import '../data_soruce/auth/LoginAuthProvider.dart';


class LoginRepo extends Logininterface {
  final LoginAuthProvider loginAuthProvider;

  LoginRepo({required this.loginAuthProvider});

  @override
  Future<Either<AppException, ResponseUser>> loginRepo(String email, String password) async {
    final storage=await SharedPreferences.getInstance();
    try {
      final response = await loginAuthProvider.login(email, password);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final responseUser = ResponseUser.fromJson(response.data['response']);
      await  storage.setString("token",responseUser.token!);
      await  storage.setString("name",responseUser.name??responseUser.username!);
      await storage.setString("mobile",responseUser.mobileNumber??"");
      await  storage.setString("name",responseUser.name??responseUser.username!);
      await  storage.setString("email",responseUser.email!);
      await storage.setInt("status",responseUser.status??0);
      await storage.setString("password",password);
      await storage.setString("remeberToken",responseUser.remember_token??"");
      await storage.setString("refreshExpires",responseUser.refresh_token_expires_at??"");
      return Right(responseUser);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, MeModel>> me() async{
    try {
      final response = await loginAuthProvider.me();

      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final responseUser = MeModel.fromJson(response.data['response']);

      return Right(responseUser);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, ResponseUser>> refreshTokenApi(String? rememberToken) async{

    try {
      final storage=await SharedPreferences.getInstance();
      final response = await loginAuthProvider.refreshTokenApi(rememberToken!);
      print(rememberToken);
      print(response);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }
      final responseUser = ResponseUser.fromJson(response.data['response']);
      await  storage.setString("token",responseUser.token!);
      await  storage.setString("name",responseUser.name??responseUser.username!);
      await storage.setString("mobile",responseUser.mobileNumber??"");
      await  storage.setString("name",responseUser.name??responseUser.username!);
      await  storage.setString("email",responseUser.email!);
      await storage.setInt("status",responseUser.status??0);
      await storage.setString("remeberToken",responseUser.remember_token??"");
      await storage.setString("refreshExpires",responseUser.refresh_token_expires_at??"");
      return Right(responseUser);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
}

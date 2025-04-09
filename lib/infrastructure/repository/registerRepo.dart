import 'package:cfc_main/domain/model/RegestrationModel.dart';
import 'package:cfc_main/domain/model/termsAndConditions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/appException.dart';
import '../../domain/interface/registerInterFace.dart';
import '../data_soruce/auth/RegestrationProvider.dart';
class RegisterRepo extends RegisterInterFace {

  final RegAuthProvider regAuthProvider;
  RegisterRepo({required this.regAuthProvider});

  @override
  Future<Either<AppException, ResponseRegister>>  registerRepo(String email ,String password,String name,String username,String mobile_number,String country_code,String role_type,String registration_type) async {
    final storage=await SharedPreferences.getInstance();
    try {
      final response = await regAuthProvider.register(email, password,name,username,mobile_number,country_code,role_type,registration_type);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final responseRegister = ResponseRegister.fromJson(response.data['response']);
      await  storage.setString("name",responseRegister.name??"");
      await storage.setString("mobile",responseRegister.mobileNumber??"");
      await storage.setString("token",responseRegister.token??"");
      await storage.setString("email",responseRegister.email??"");
      await storage.setInt("status",responseRegister.status?.toInt()??0);
      return Right(responseRegister);

    } on DioException catch (e) {
      print("rererererrere ${AppException.fromDioError(e)}");
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, TermsAndConditions>> termsAndcondition()async {
    try{
      final response=await regAuthProvider.terms();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }

      final terms=TermsAndConditions.fromJson(response.data['response']);
      return Right(terms);

    }on DioException catch(e){
      return Left(AppException(e.toString() ));

    }catch(e){
      return Left(AppException(e.toString()));

    }
  }

}

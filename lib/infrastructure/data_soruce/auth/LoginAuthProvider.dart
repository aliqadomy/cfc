import 'package:cfc_main/core/appColor.dart';
import 'package:dio/dio.dart';


class LoginAuthProvider{
  LoginAuthProvider({required this.dio});
  final Dio dio;

  Future<dynamic> login(String email ,String password)async{

  return await DioHelper.postData(url:'https://api.cfc.sa/api/login',data: {
    'email':email,
    'password':password
  });
  }

  Future<dynamic> me()async{

    return await DioHelper.postData(url:'https://api.cfc.sa/api/me');
  }
}
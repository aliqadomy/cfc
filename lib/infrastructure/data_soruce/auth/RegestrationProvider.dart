import 'package:cfc_main/core/appColor.dart';
import 'package:dio/dio.dart';


class RegAuthProvider{
  RegAuthProvider({required this.dio});
  final Dio dio;

  Future<dynamic> register(String email ,String password,String name,String username,String mobile_number,String country_code,String role_type,String registration_type)async{
    return await DioHelper.postData(url:'https://api.cfc.sa/api/register',data: {
      'email':email,
      'password':password,
      'name':name,
      'username':username,
      'mobile_number':mobile_number,
      'country_code':country_code,
      'role_type':role_type,
      'registration_type':registration_type,
    });
  }

  Future<dynamic> terms()async{
    return await DioHelper.getData(url:'https://api.cfc.sa/api/get_page_by_id_outside/3');
  }
}
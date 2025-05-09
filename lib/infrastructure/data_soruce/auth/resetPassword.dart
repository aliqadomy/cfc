import 'package:dio/dio.dart';

import '../../../core/appColor.dart';

class ResetAuth{
  ResetAuth({required this.dio});
  final Dio dio;
  Future<dynamic> changePassword(int id ,String oldPass,String newPass)async{
    return await DioHelper.postData(
        url:'https://api.cfc.sa/api/borrower_password_update',query: {
      'old_password':oldPass,
      'password':newPass
    },header: {
    }
    );
  }

  Future<dynamic> changePasswordOtp(String email ,String oldPass,String newPass)async{
    return await DioHelper.postData(
        url:'https://api.cfc.sa/api/updatePasswordOtpNew',query: {
          'email':email,
      'password':oldPass,
      'confirm_password':newPass
    }
    );
  }
}
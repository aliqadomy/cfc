import '../../../core/appColor.dart';

class OtpProvider {
  Future<dynamic> sendOtpProFun(String email)async{
    return await DioHelper.postData(url:'https://api.cfc.sa/api/send_otp',data: {
      'email':email,
    });
  }
  Future<dynamic> verfiyOtpFun(String email,String otp)async{
    return await DioHelper.postData(url:'https://api.cfc.sa/api/verify_otp',data: {
      'email':email,
      'otp':otp
    });
  }
}
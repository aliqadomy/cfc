import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppColors{
  static const Color white=Color(0xFFEFF1F6);
  static const Color blue=Color(0xFF2B0066);
  static const Color green=Color(0xFF00C48A);
  static const Color softWhite=Color(0xFFE9E4F0);
  static const Color gray=Color(0xFF5E5E5E);
  static const Color background2=Color(0xFFE8E6F1);
  static const Color whiteBox=Color(0xFFF5F5F5);
  static const Color shadowBlack=Color(0xFF000000);
  static const Color accountNumber=Color(0xFF6C757D);
  static const Color black=Color(0xFF000000);
  static const Color index1_dashBoard=Color(0xFF00C48A);



  static saudiSign(Color color,{double opc = 0.5,double width = 15.0,double height = 15.0}) {

    return Image.asset(
      'assets/images/saudi_sign.png',
      width: width,
      height: height,
      color: color.withOpacity(opc),
    );
  }
}
class ShowToastWidget{
  static showToast(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.green,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
  static CircularDialog(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}


class TokenManager{
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print("ssssssss $token");
    return token;
  }
}

class CustomLanguage{
  static Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }
}

class Urls{
  static const String BASE_URL = "https://backend.podqasti.com/api/v1";
  static const String Login="/login";
  static const String visitor="/footer";
}

class LanguageManager {
  static String _languageCode = "en"; // Default language
  static String get languageCode => _languageCode;

  static void updateLanguage(String newLanguageCode) {
    _languageCode = newLanguageCode;
  }
}


class DioHelper{
  static Dio? _dio;
  static init() {
    _dio = Dio(

      BaseOptions(
          baseUrl: Urls.BASE_URL,
          receiveDataWhenStatusError: true,
          connectTimeout:const  Duration(milliseconds: 60000),
          responseType: ResponseType.json,
          validateStatus: (status) {
            return status! < 500;  // Accept all responses except for status codes 500 and above
          },
          headers: {
            'Accept': 'application/json, text/plain, */*',
            'Connection': 'keep-alive',
            'Content-Type': 'application/json',
            "Authorization":"Bearer ${TokenManager.getToken()}"
          }),
    );
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Get the token
        String? token = await TokenManager.getToken();
        print("yyyyyyyyyyyyyyyyyyyyyyyyyyyzzzzz $token");


        if (token != null || token !="") {
          print("eeeee $token");
          options.headers["Authorization"] = "Bearer $token";
        }
       String languageCode=LanguageManager._languageCode;
        options.headers["Accept-Language"] = languageCode;


        return handler.next(options);
      },
    ));
  }


//GET Method
  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    Map<String,dynamic>? header,

  }) async {
    return _dio!.get(url, queryParameters: query,options: Options(headers: header));
  }



  static Future<Response> postData({
    required url,
    Map<String, dynamic>? query,
    dynamic data,
    Map<String,dynamic>? header,
    String? token,
  }) async {
    return _dio!.post(url, queryParameters: query,data:data,options: Options(headers: header,   followRedirects: false,
      // will not throw errors
      validateStatus: (status) => true,) );
  }
}

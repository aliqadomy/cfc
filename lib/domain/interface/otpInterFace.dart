import 'package:dartz/dartz.dart';

import '../model/SendOtpModel.dart';

abstract class OtpInterFace{
  Future<Either<dynamic, SendOtpModel>> sendOtpRepFun(String email);
  Future<Either<dynamic, SendOtpModel>> verfiyOtpRepFun(String email,String otp);
}
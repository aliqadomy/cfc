import 'package:cfc_main/domain/model/RegestrationModel.dart';
import 'package:cfc_main/domain/model/termsAndConditions.dart';
import 'package:dartz/dartz.dart';


abstract class RegisterInterFace{
  Future<Either<dynamic,ResponseRegister>> registerRepo(String email ,String password,String name,String username,String mobile_number,String country_code,String role_type,String registration_type);
  Future<Either<dynamic,TermsAndConditions>> termsAndcondition();

}
import 'package:dartz/dartz.dart';

import '../model/MeModel.dart';
import '../model/Response.dart';

abstract class Logininterface{
  Future<Either<dynamic,ResponseUser>> loginRepo(String email,String password);
  Future<Either<dynamic,MeModel>> me();
}
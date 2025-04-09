import 'package:cfc_main/domain/model/VisitorResponse.dart';
import 'package:dartz/dartz.dart';


abstract class VisitorInterFace{
  Future<Either<dynamic,List<VisitorResponse>>> visitor();
}
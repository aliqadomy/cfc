import 'package:cfc_main/domain/interface/visitorInterFace.dart';
import 'package:cfc_main/domain/model/VisitorResponse.dart';
import 'package:cfc_main/infrastructure/data_soruce/visitor/visitorProvider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/appException.dart';

class VisitorRepo extends VisitorInterFace{
  VisitorRepo({ required this.visitorProvider});
  VisitorProvider visitorProvider;
  @override
  Future<Either<dynamic, List<VisitorResponse>>> visitor() async{
    List<VisitorResponse> list=[];
    try{
      final response=await visitorProvider.VistitorData();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      for(var item in response.data['response'])
        {
          list.add(VisitorResponse.fromJson(item));
        }

      return Right(list);

    }on DioException catch(e){
      return Left(AppException(e.toString()));

    }catch(e){
      return Left(AppException(e.toString()));

    }
  }

  
}
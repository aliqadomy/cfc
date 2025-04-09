
import 'package:cfc_main/infrastructure/data_soruce/kyc/KycProvider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/appException.dart';
import '../../../domain/model/kyc/ShowKyc.dart';

class KycRepo {
  KycRepo({ required this.kycprovider});
  Kycprovider kycprovider;
  Future<Either<dynamic, List<ShowKyc>>> showUserKyc() async{
    List<ShowKyc> list=[];
    try{
      final response=await kycprovider.showUserKyc();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      for(var item in response.data['response'])
      {
        list.add(ShowKyc.fromJson(item));
      }

      return Right(list);

    }on DioException catch(e){
      return Left(AppException(e.toString()));

    }catch(e){
      return Left(AppException(e.toString()));

    }
  }


}
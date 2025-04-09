
import 'package:cfc_main/domain/model/WatheqModel.dart';
import 'package:cfc_main/infrastructure/data_soruce/opportuinity/OpportunityDataProvider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/appException.dart';

class WatheqRepo  {
  final Opportunitydataprovider opportunitydataprovider;

  WatheqRepo({required this.opportunitydataprovider});

  Future<Either<AppException, WatheqModel>> watheqIqamaReop(String iqama,
      String date) async {

    try {
      final response = await opportunitydataprovider.watheqIqama(iqama, date);
     if(response.data['response']['errorId'] != null){
       return Left(AppException("id number or date is invalid"));
     }
      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final res = WatheqModel.fromJson(response.data['response']);

      return Right(res);
    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  Future<Either<AppException, WatheqModel>> watheqSaudiRepo(String iqama,
      String date) async {

    try {
      final response = await opportunitydataprovider.watheqsaudi(iqama, date);
      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      final res = WatheqModel.fromJson(response.data['response']);
      return Right(res);
    } on DioException catch (e) {
    return Left(AppException.fromDioError(e));
    } catch (error) {
    return Left(AppException(error.toString()));
    }
  }
}
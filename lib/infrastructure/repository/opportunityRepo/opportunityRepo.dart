import 'package:cfc_main/domain/interface/opportunity.dart';
import 'package:cfc_main/domain/model/opportunity/Attachment.dart';
import 'package:cfc_main/domain/model/opportunity/ModefiyKyc.dart';
import 'package:cfc_main/domain/model/opportunity/OpportunityDetails.dart';
import 'package:cfc_main/infrastructure/data_soruce/opportuinity/OpportunityDataProvider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/appException.dart';
import '../../../domain/model/opportunity/all_opportunity_model.dart';

class OpportunityRepo extends OpportunityInterFace {
  Opportunitydataprovider opportunitydataprovider;
  OpportunityRepo({required this.opportunitydataprovider});

  @override
  Future<Either<dynamic, AllOpportunityModel>> allOpportunity() async {
    AllOpportunityModel allOpportunityModel;
    try {
      final response = await opportunitydataprovider.allOpportunityData();
      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response'] ?? 'Unknown error occurred'));
      }
      allOpportunityModel =
          AllOpportunityModel.fromJson(response.data['response']);
      return Right(allOpportunityModel);
    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  Future<Either<dynamic, ModefiyKyc>> modefiyKycRepo(
      String email,
      String mobileNumber,
      String matiralStatus,
      String familyNumber,
      String gender,
      String education,
      String region,
      String jobStatus,
      String nationalityLocation,
      String identityType,
      String nationality,
      String bank,
      String date,
      String idNumber,
      String iban,
      bool income,
      bool one,
      bool two,
      bool three,
      bool four,
      bool five,
      bool six,
      bool seven,
      bool eight,
      bool wkaleh,
      bool selectedAnswer,
      String arabicName,
      String englishName) async {
    try {
      final response = await opportunitydataprovider.modifyKyc(
          email,
          mobileNumber,
          matiralStatus,
          familyNumber,
          gender,
          education,
          region,
          jobStatus,
          nationalityLocation,
          identityType,
          nationality,
          bank,
          date,
          idNumber,
          iban,
          income,
          one,
          two,
          three,
          four,
          five,
          six,
          seven,
          eight,
          wkaleh,
          selectedAnswer,
          arabicName,
          englishName);


      if (response.data['status'] == false) {
        print("ssssseeee1 $response");
        return Left(AppException(

            response.data['response'] ?? 'Unknown error occurred'));
      }
      var res = ModefiyKyc.fromJson(response.data['response']);
      print("eeeeeee");
      return Right(res);
    } on DioException catch (e) {

      return Left(AppException.fromDioError(e));
    } catch (error) {

      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, AllOpportunityModel>> myOpportunity() async {
    AllOpportunityModel allOpportunityModel;
    try {
      final response = await opportunitydataprovider.myOpportunityData();
      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response'] ?? 'Unknown error occurred'));
      }
      allOpportunityModel =
          AllOpportunityModel.fromJson(response.data['response']);
      return Right(allOpportunityModel);
    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, List<Attachment>>> myOpportunityAttachment(
      int id) async {
    List<Attachment> list = [];
    try {
      final response =
          await opportunitydataprovider.myOpportunityAttachment(id);

      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response'] ?? 'Unknown error occurred'));
      }
      for (var i in response.data['response']) {
        list.add(Attachment.fromJson(i));
      }
      return Right(list);
    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, OpportunityDetails>> myOpportunityDetails(
      int id) async {
    try {
      final response = await opportunitydataprovider.myOpportunityDetails(id);
      if (response.data['status'] == false) {
        return Left(AppException(
            response.data['response'] ?? 'Unknown error occurred'));
      }
      print("ppp ${response.data['response']}");
      final opportunityDetails =
          OpportunityDetails.fromJson(response.data['response']);
      return Right(opportunityDetails);
    } on DioException catch (e) {
      print("ppp ${AppException.fromDioError(e)}");
      return Left(AppException.fromDioError(e));
    } catch (error) {
      print("ppp ${error.toString()}");
      return Left(AppException(error.toString()));
    }
  }
}

import 'package:cfc_main/domain/interface/myWalletInterFce.dart';
import 'package:cfc_main/domain/model/wallet/UserKycModel.dart';
import 'package:cfc_main/domain/model/wallet/WalletResponseModel.dart';
import 'package:cfc_main/domain/model/wallet/WithDrawBalance.dart';
import 'package:cfc_main/domain/model/wallet/finicialStatmentModel.dart';
import 'package:cfc_main/domain/model/wallet/paymentGetWayModel.dart';
import 'package:cfc_main/infrastructure/data_soruce/my_wallet/myWalletProvider.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/InvestResponse.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/appException.dart';

class MyWalletRepo extends MyWalletInterFce
{
  Mywalletprovider myWalletprovider;
  MyWalletRepo({required this.myWalletprovider});
  @override

  Future<Either<dynamic, WalletResponseModel>> walletBalance() async{
    try {
      final response = await myWalletprovider.MyWalletBalance();
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }

      final walletBalance = WalletResponseModel.fromJson(response.data['response']);
      return Right(walletBalance);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  @override
  Future<Either<dynamic, List<WalletData>>> finicialStatment(int role_type) async{
    try {

      List<WalletData> statment=[] ;
      final response = await myWalletprovider.finicalStatment(role_type);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }
      for(var i in response.data['response']['data']['wallet_data'])
        {
          statment.add(WalletData.fromJson(i));
        }
      return Right(statment);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
  Future<Either<dynamic, WithDrawBalance>> paymentWithdraw(String amount,String creditAccount,String bic) async{
    try {
      final response = await myWalletprovider.paymentWithdraw(amount, creditAccount, bic);
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }
      final walletBalance = WithDrawBalance.fromJson(response.data['response']);
      return Right(walletBalance);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
Future<Either<dynamic, InvestResponse>> invest(String amount,String invester,String campaign) async{
  try {
    final response = await myWalletprovider.invest(amount, invester, campaign);
    if (response.data['status'] == false) {

      return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
    }
    final invest = InvestResponse.fromJson(response.data['response']);
    return Right(invest);

  } on DioException catch (e) {
    print('DioException: ${e.message}');
    print('Response: ${e.response?.data}');
    return Left(AppException.fromDioError(e));
  } catch (error) {
    print("ppppp ${error.toString()}");
    return Left(AppException(error.toString()));
  }
}
  @override
  Future<Either<dynamic, UserKycModel>> userKyc() async{
    try {
      List<UserKycModel> userKyc=[] ;
      final response = await myWalletprovider.userKyc();

      if (response.data['status'] == false) {
        return Left(AppException(response.data['response']['message'] ?? 'Unknown error occurred'));
      }
      var id;
      for(var item in response.data['response'])
      {
        userKyc.add(UserKycModel.fromJson(item));
      }
      id=userKyc.firstWhere((i)=>i.id==4);
      return Right(id);

    } on DioException catch (e) {

      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }

  Future<Either<dynamic, PaymentGetWayModel>> addBalance(int amount) async{
    try {
      final response = await myWalletprovider.addBalance(amount);
      print("$response");
      if (response.data['status'] == false) {
        return Left(AppException(response.data['response'] ?? 'Unknown error occurred'));
      }
      final walletBalance = PaymentGetWayModel.fromJson(response.data['response']);
      return Right(walletBalance);

    } on DioException catch (e) {
      return Left(AppException.fromDioError(e));
    } catch (error) {
      return Left(AppException(error.toString()));
    }
  }
}
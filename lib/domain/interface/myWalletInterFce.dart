import 'package:cfc_main/domain/model/wallet/UserKycModel.dart';
import 'package:cfc_main/domain/model/wallet/WalletResponseModel.dart';
import 'package:cfc_main/domain/model/wallet/finicialStatmentModel.dart';
import 'package:dartz/dartz.dart';

import '../../infrastructure/repository/my_wallet_repo/InvestResponse.dart';
import '../model/wallet/WithDrawBalance.dart';


abstract class MyWalletInterFce{
  Future<Either<dynamic,WalletResponseModel>> walletBalance();
  Future<Either<dynamic,List<WalletData>>> finicialStatment(int role_type);
  Future<Either<dynamic,WithDrawBalance>> paymentWithdraw(String amount,String creditAccount,String bic);
  Future<Either<dynamic, InvestResponse>> invest(String amount,String invester,String campaign);
  Future<Either<dynamic, UserKycModel>> userKyc();


}
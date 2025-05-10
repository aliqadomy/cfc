import 'package:url_launcher/url_launcher.dart';

import '../../../core/appColor.dart';

class Mywalletprovider{
  Future<dynamic> MyWalletBalance()async{

    return await DioHelper.getData(url:"https://api.cfc.sa/api/wallet_investor_sum",header: {
    });
  }
  Future<dynamic> finicalStatment(int role_type)async{
    return await DioHelper.getData(url:"https://api.cfc.sa/api/getDataTable",query: {
      'role_type':role_type,
      'user_id':0
    },header: {
    });
  }
  Future<dynamic> paymentWithdraw(String amount,String creditAccount,String bic)async{
    return await DioHelper.postData(url:"https://api.cfc.sa/api/payment",data: {
      'amount':amount,
      'creditAccount':creditAccount,
      'bic':bic
    });
  }

  Future<dynamic> invest(String amount,String invester,String campagin)async{

    return await DioHelper.postData(url:"https://api.cfc.sa/api/invest",query: {
      'amount':amount,
      'invester':invester,
      'campaign':campagin
    },header: {
      'amount':amount,
      'invester':invester,
      'campaign':campagin
    });
  }

  Future<dynamic> userKyc()async{

    return await DioHelper.getData(url:"https://api.cfc.sa/api/show_userkyc",query: {
    },header: {
    });
  }

  Future<void> addBalance(String amount) async {
    final Uri url = Uri.parse('https://api.cfc.sa/api/redirect?amount=$amount');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }


}
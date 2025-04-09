import '../../../core/appColor.dart';

class Kycprovider{
  Future<dynamic> showUserKyc()async{
    return await DioHelper.getData(url: "https://api.cfc.sa/api/show_userkyc",header: {
    });
  }

}
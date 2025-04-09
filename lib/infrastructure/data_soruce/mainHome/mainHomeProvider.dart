
import '../../../core/appColor.dart';

class MainHomeProvider{


  Future<dynamic> investorDashBoardData()async{
    return await DioHelper.postData(url: "https://api.cfc.sa/api/investordashboard",header: {
    });
  }
  Future<dynamic> accountNumberData()async{
    return await DioHelper.getData(url: "https://api.cfc.sa/api/account_number",header: {

    });
  }
  Future<dynamic> nearestDateData()async{
    return await DioHelper.getData(url: "https://api.cfc.sa/api/nearestDate",header: {
    });
  }
}
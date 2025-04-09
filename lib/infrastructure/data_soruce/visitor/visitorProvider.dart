import 'package:cfc_main/core/appColor.dart';

class VisitorProvider{

  Future<dynamic> VistitorData()async{
    return await DioHelper.getData(url: "https://api.cfc.sa/api/footer");
  }
}
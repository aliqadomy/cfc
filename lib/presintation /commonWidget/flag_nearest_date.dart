import 'package:cfc_main/domain/model/nearestDateModel.dart';
import 'package:flutter/material.dart';

import '../../core/appColor.dart';

class NearestDateFlag extends StatelessWidget {
   NearestDateFlag({Key? key, this.nearestDateModel,required this.title,this.haveSign=false}) ;
   final dynamic nearestDateModel;
  String title;
  bool haveSign;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right:12,bottom: 5,top: 5),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30,right: 10),
              width: MediaQuery.of(context).size.width*0.35,
              height: 40,
              color: AppColors.softWhite,alignment: Alignment.center,
              child: Center(child: Text(title,textAlign: TextAlign.center,)),),
            const Divider(
              color: Colors.black,
              thickness: 3,
              height: 2,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30,right: 12),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.4,
              height: 45,
              color: AppColors.white,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${nearestDateModel??"0"}",textAlign: TextAlign.center,),
                  const SizedBox(width: 5,),
                  haveSign?AppColors.saudiSign(AppColors.black):const SizedBox()
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

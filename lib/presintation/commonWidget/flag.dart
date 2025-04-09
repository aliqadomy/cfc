import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/appColor.dart';

class FlagCard extends StatelessWidget {
   FlagCard({@required this.titleOne,@required this.titleTwo,required this.index,required this.signValue}) ;
  String? titleOne;
  String? titleTwo;
  int index;
  bool signValue=false;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.of(context).size.width*0.275,
      height: MediaQuery.of(context).size.height*0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        index==0?
            Image.asset("assets/images/total_profit.png",fit: BoxFit.fill,)
            :index==1?
        Image.asset("assets/images/totoal_invest.png",fit: BoxFit.fill,)
            :
        Image.asset("assets/images/num_invest.png",fit: BoxFit.fill,),
        Text(titleTwo!,style: const TextStyle(fontSize: 12,color: AppColors.blue,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleOne!,style: const TextStyle(fontSize: 22,color: AppColors.green,fontWeight: FontWeight.w500),),
            const SizedBox(width: 5,),
            signValue?AppColors.saudiSign(Colors.green):const SizedBox()
          ],
        ),
      ],),
    );
  }
}

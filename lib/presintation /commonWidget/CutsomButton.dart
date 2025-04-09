import 'dart:ffi';
import 'dart:ui';

import 'package:cfc_main/core/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/data_soruce/my_wallet/myWalletProvider.dart';
import '../../infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import '../home/wallet/withdraw_bloc/withdraw_bloc.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key,required this.colors,required this.title,required this.onTap,this.w=0.35});
  Color? colors;
  String? title;
  double w;
   VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WithdrawBloc(
        myWalletRepo: MyWalletRepo(myWalletprovider: Mywalletprovider()),
      ),
      child:GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height:MediaQuery.of(context).size.height*0.045 ,
        width: MediaQuery.of(context).size.width*w,
        decoration: BoxDecoration(
          color: colors??AppColors.green,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Text(title??"-",style: const TextStyle(color: AppColors.white,fontSize:12 ,fontWeight:FontWeight.w700 ),),
      ),
    ),
);
  }
}

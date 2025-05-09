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
   CustomButton({this.w=0.35, this.colors, this.title, this.onTap});
  Color? colors;
  String? title;
  double w;
   VoidCallback? onTap;
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
        padding: EdgeInsets.all(10),
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

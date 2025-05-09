import 'package:cfc_main/core/appColor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/login/screen/login.dart';
import '../auth/regestration/regestrationInvestorScreen.dart';
import '../commonWidget/appBar.dart';
import '../commonWidget/button.dart';
import '../visitor/visitorScreen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const routename='/onBoarding';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(backIcon: true,),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 28,right: 28),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.20,),
            SvgPicture.asset('assets/images/image 406-2.svg'),
             SizedBox(height: MediaQuery.of(context).size.height*0.13),
             Column(children: [
            CustomButton( AppColors.softWhite, AppLocalizations.of(context)!.login, AppColors.blue, (){
                Navigator.pushNamed(context,LoginScreen.routename);
              },18,FontWeight.bold),

               const SizedBox(height: 20,),
              CustomButton( AppColors.blue, AppLocalizations.of(context)!.invReg , AppColors.white, (){
                Navigator.pushNamed(context,RegestationInvestorScreen.routename);
              },18,FontWeight.bold),
               const SizedBox(height: 20,),
              CustomButton(AppColors.green,  AppLocalizations.of(context)!.vistor, AppColors.white, (){
                Navigator.pushNamed(context,Visitorscreen.routename);
              },18,FontWeight.bold)

            ],)
          ],
        ),
      ),
    );
  }
}

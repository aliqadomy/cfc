import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/presintation%20/commonWidget/button.dart';
import 'package:cfc_main/presintation%20/home/mainHome/mainHome.dart';
import 'package:cfc_main/presintation%20/onBoarding/onBoarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/Language_model.dart';
import '../../core/lang.dart';
import '../../main.dart';
import '../home/Settings/setting_fileds.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routename="/welcomeScreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/image 406.svg'),
            const SizedBox(height: 56,),
              Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset("assets/images/authrization-2.png",width: 14,height: 14,),
                     const SizedBox(width: 5,),
                     Text(AppLocalizations.of(context)!.welcomes,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                   ],
                 )
               ],
             ),
            const SizedBox(height: 70,),
            SettingFileds(title: AppLocalizations.of(context)!.lang,
              mainButton:   DropdownButton<Language>(
                onChanged: (Language? language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale);
                    // BlocProvider.of<LanguageBloc>(context).add(LanguageEvents());
                    setState(() {
                    });
                  }
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(

                      (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                ).toList(),
              ),),
            const SizedBox(height: 70,),
            CustomButton(1, AppColors.green, AppLocalizations.of(context)!.welcome, AppColors.white,
                    ()async{
              Navigator.pushNamed(context, OnBoardingScreen.routename);
            },22,FontWeight.bold),


          ],
        ),
      ),
    );
  }
}

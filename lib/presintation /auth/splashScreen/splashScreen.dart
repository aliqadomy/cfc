import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../welcome/welcomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const baseRoute='/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

late AnimationController anmationController;
late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    anmationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin: const Offset(0,4),end: Offset.zero).animate(anmationController);
    anmationController.forward();
    slidingAnimation.addListener((){
      setState(() {

      });
    });
    Future.delayed(const Duration(seconds: 2),(){Navigator.pushNamed(context, WelcomeScreen.routename);});
    super.initState();
  }

  @override
  void dispose() {
    anmationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(
          image: AssetImage('assets/images/splash.png',),
          fit: BoxFit.cover
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
                position: slidingAnimation,
                child: Image.asset("assets/images/cfc_logo.png"))
          ],
        ),
      ),
    );
  }
}

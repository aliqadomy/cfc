import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/presintation%20/auth/login/login_bloc.dart';
import 'package:cfc_main/infrastructure/data_soruce/auth/LoginAuthProvider.dart';
import 'package:cfc_main/infrastructure/repository/loginRepo.dart';
import 'package:dio/dio.dart';
import 'package:cfc_main/core/appRouter.dart';

import 'core/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await Firebase.initializeApp();
  NotificationService notificationService = NotificationService();
  notificationService.requestNotificationPermission();
  notificationService.firebaseInit();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingOnBackGroundHandler);

  // Initialize the app
  runApp(BlocProvider(
    create: (context) => LoginBloc(loginRepo: LoginRepo(loginAuthProvider: LoginAuthProvider(dio: Dio()))),
    child: MyApp(),
  ));
}
@pragma('vm:entry-point')
Future<void> _firebaseMessagingOnBackGroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCDQCyD00JK_KjH9Hx5Mu0xzddlwhRDXKE',
        appId: '1:897114328485:ios:3a5476cc8f070762782c4c',
        messagingSenderId: '897114328485',
        projectId: 'cfca-23a75',
        storageBucket: 'cfca-23a75.firebasestorage.app',
      ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    getFcmToken();
    // Load saved locale on app start
    _loadLocale();
  }

  void getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();

    if (token != null) {
      print("FCM Token: $token");
      // Store or send token to your backend
    } else {
      print("Failed to get FCM token");
    }
  }

  // Load locale from SharedPreferences
  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');

    // If no language is saved, use device's default locale
    if (languageCode != null) {
      setState(() {
        _locale = Locale(languageCode);
      });
    } else {
      setState(() {
        _locale = Locale('en'); // Default to English if no saved locale
      });
    }
  }

  // Save the selected language to SharedPreferences
  setLocale(Locale locale) async {
    setState(() {
      _locale = locale;
    });

    // Save the language to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', locale.languageCode);

    LanguageManager.updateLanguage(locale.languageCode); // Update language in LanguageManager
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _locale?.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        onGenerateRoute: AppRouter.generateRoute,
        title: 'CFC',
        theme: ThemeData(
          fontFamily: 'Almarai',
          primaryColor: AppColors.background2,
          scaffoldBackgroundColor: AppColors.background2,
        ),
      ),
    );
  }
}

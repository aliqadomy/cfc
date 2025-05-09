import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/presintation/home/Settings/setting_fileds.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/Language_model.dart';
import '../../../core/lang.dart';
import '../../../main.dart';
import '../../auth/change_password/change_password.dart';
import '../../auth/login/screen/login.dart';
import '../../commonWidget/CutsomButton.dart';
import '../../commonWidget/appBar.dart';
import 'notification/notification_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool loading = false;
  String? rememberToken;
  bool _isSwitched = false;

  @override
  void initState() {
    _loadCredentials();
    _loadSwitchState();
    super.initState();
  }

  _loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSwitched = prefs.getBool('isSwitched') ?? false;
    });
  }

  // Save switch state to SharedPreferences
  _saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSwitched', value);
  }

  _loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberToken = prefs.getString('remeberToken');

    });
  }

  // Clear saved credentials from SharedPreferences
  _clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.remove('remeberToken');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.background2,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SettingFileds(
            title: AppLocalizations.of(context)!.changePassword,
            icon: const Icon(Icons.password),
            mainButton: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ChangePassword.routename);
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          SettingFileds(
            title: AppLocalizations.of(context)!.faceid,
            icon: const Icon(Icons.remove_red_eye),
            mainButton: Switch(
              value: _isSwitched,
              onChanged: (bool value) {
                setState(() {
                  _isSwitched = value;
                  _saveSwitchState(value);

                  // If true, show dialog to return to login
                  if (_isSwitched) {
                    _showLoginDialog();
                  } else {
                    _clearCredentials();
                  }
                });
              },
            ),
          ),
          SettingFileds(
            title: AppLocalizations.of(context)!.notifications,
            icon: const Icon(Icons.notifications_active),
            mainButton: IconButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(NotificationScreen.routename);
                },
                icon: const Icon(Icons.arrow_forward_ios)),
          ),
          SettingFileds(
            title: AppLocalizations.of(context)!.contactus,
            icon: const Icon(Icons.call),
            mainButton: IconButton(
              onPressed: () async {
                // Show dialog using showDialog function
                showDialog(
                  context: context, // Ensure that context is passed here
                  barrierDismissible:
                      true, // Allow dismissal of dialog on tap outside
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: SizedBox(
                        height: 225,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.contactus,
                              style: const TextStyle(
                                  fontFamily: "almarai",
                                  fontSize: 17,
                                  color: AppColors.green),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 16, end: 16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.call,
                                          color: AppColors.green),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () async {
                                          await _launchWhatsApp('0560284941');
                                        },
                                        child: const Text("Whatsapp"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.mail,
                                          color: AppColors.green),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () async {
                                          await _launchEmail("care@cfc.sa");
                                        },
                                        child: Text("email"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.cancel,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          SettingFileds(
            title: AppLocalizations.of(context)!.lang,
            mainButton: DropdownButton<Language>(
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                  // BlocProvider.of<LanguageBloc>(context).add(LanguageEvents());
                  setState(() {});
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
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
            child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: CustomButton(
                    onTap: () async {

                      setState(() {
                        loading = true;
                      });
                      Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.routename,
                          (Route<dynamic> route) => false);
                    },
                    colors: AppColors.green,
                    title: AppLocalizations.of(context)!.logout)),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsApp(String phoneNumber) async {
    final url = 'https://wa.me/$phoneNumber'; // WhatsApp URL format

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open WhatsApp';
    }
  }

  Future<void> _launchEmail(String emailAddress) async {
    final url = 'mailto:$emailAddress'; // Email URL scheme

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open email client';
    }
  }

  _showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(AppLocalizations.of(context)!.logRequired),
          content:  Text(AppLocalizations.of(context)!.logRequiredDesc),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _navigateToLogin(); // Navigate to the login page
              },
              child:  Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        );
      },
    );
  }

  // Navigate to the login screen
  _navigateToLogin() {
    // Here you can navigate to the login page if needed
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routename, (Route<dynamic> route) => false);
  }
}

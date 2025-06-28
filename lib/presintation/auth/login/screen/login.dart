// LoginScreen.dart

import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/domain/model/Response.dart';
import 'package:cfc_main/local_authintication/localAuth.dart';
import 'package:cfc_main/presintation/auth/verfiy_otp/verfiy_otp.dart';
import 'package:cfc_main/presintation/auth/verfiy_otp/verfiy_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../commonWidget/button.dart';
import '../../../commonWidget/customTextInput.dart';
import '../../../home/mainHome/mainHome.dart';
import '../../../onBoarding/onBoarding.dart';
import '../../verfiy_otp/dialog/otpDialog.dart';
import '../login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routename = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  bool secure = true;
  bool loading = false;
  bool otpLoading = false;
  late ResponseUser user;
  String? expiryString;
  String? refreshToken;
  String? email;

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  Future<bool> checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    expiryString = prefs.getString('refresh_token_expires_at');
    refreshToken = prefs.getString('remeberToken');
    if (expiryString == null || refreshToken == null) return false;

    final expiryDate = DateTime.tryParse(expiryString!);
    if (expiryDate == null || DateTime.now().isAfter(expiryDate)) return false;

    return true;
  }

  void getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    emailController.text = email ?? "";
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          final prefs = await SharedPreferences.getInstance();
          user = state.user;
          await prefs.setString('token', user.token ?? "");
          await prefs.setString('username', user.username ?? "");
          await prefs.setString('user_id', user.id ?? "");
          await prefs.setString('email', user.email ?? "");
          await prefs.setString(
              'refresh_token_expires_at', user.refresh_token_expires_at ?? "");
          setState(() => loading = false);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeMain.routename,
            (Route<dynamic> route) => false,
          );
        } else if (state is LoginFailure) {

          setState(() => loading = false);
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title:  Text(AppLocalizations.of(context)!.authFailed),
                content: Text(AppLocalizations.of(context)!.authFailed),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:  Text(AppLocalizations.of(context)!.ok),
                  ),
                ],
              ),
            );

        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.background2,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              OnBoardingScreen.routename,
              (Route<dynamic> route) => false,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Text(
                AppLocalizations.of(context)!.login,
                style: const TextStyle(fontSize: 30, color: AppColors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.softWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 90),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        Customtextinput(
                          hintText: AppLocalizations.of(context)!.email,
                          controller: emailController,
                          secure: false,
                          validator: (value) {
                            if (value!.isEmpty)
                              return AppLocalizations.of(context)!.required;
                            if (!isValidEmail(value))
                              return AppLocalizations.of(context)!.emailRegex;
                            return null;
                          },
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 35),
                        Customtextinput(
                          hintText: AppLocalizations.of(context)!.pass,
                          controller: passwordController,
                          secure: secure,
                          validator: (value) {
                            if (value!.isEmpty)
                              return AppLocalizations.of(context)?.required;
                            return null;
                          },
                          iconPass: IconButton(
                            icon: secure
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility_outlined),
                            onPressed: () => setState(() => secure = !secure),
                          ),
                          icon: const Icon(Icons.lock),
                        ),
                        const SizedBox(height: 35),
                        CustomButton(
                          AppColors.green,
                          AppLocalizations.of(context)!.login,
                          AppColors.white,
                          () {
                            if (loginFormKey.currentState!.validate()) {
                              setState(() => loading = true);
                              context.read<LoginBloc>().add(
                                LoginWithCredentials(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                            }
                          },
                          16,
                          FontWeight.bold,
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<VerfiyOtpBloc>(context),
                                child: OtpDialog(emailController: emailController),
                              ),
                            );

                          },
                          child:  Text(
                           AppLocalizations.of(context)!.fPass,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Divider(
                                    thickness: 1, color: AppColors.green)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("OR",
                                  style: TextStyle(color: AppColors.green)),
                            ),
                            Expanded(
                                child: Divider(
                                    thickness: 1, color: AppColors.green)),
                          ],
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            var isSwitch = prefs.getBool("isSwitched") ?? false;
                            if (isSwitch) {
                              var status = await checkLoginStatus(context);
                              if (!status) {
                                print("hereeee 1");
                                dialog();
                                return;
                              }
                              final isAuthenticated =
                                  await LocalAuth.authenticate();

                              if (isAuthenticated) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginWithRefreshToken(
                                        refreshToken: refreshToken!));
                                setState(() => loading = true);
                              }
                            } else {
                              print("hereeee 2");
                              dialog();
                              return;
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.03),
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.login_face,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: AppColors.white,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: MediaQuery.of(context)
                                        .textScaleFactor
                                        .clamp(1.0, 1.2),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.015),
                                  Icon(Icons.fingerprint,
                                      color: AppColors.white,
                                      size: MediaQuery.of(context).size.width *
                                          0.06),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (loading)
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.biometricUnavailable),
        content: Text(AppLocalizations.of(context)!.biometric),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
}

import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/domain/model/Response.dart';
import 'package:cfc_main/local_authintication/localAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../commonWidget/button.dart';
import '../../../commonWidget/customTextInput.dart';
import '../../../home/mainHome/mainHome.dart';
import '../../../onBoarding/onBoarding.dart';
import '../login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routename = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool secure = true;
  late ResponseUser user;
  bool loading =false;
  String? email;
  bool isAuthiticated=true;
  @override
  void initState() {
    getEmail();
    super.initState();
  }

  void getEmail()async{
    final prefs=await SharedPreferences.getInstance();
    email=   prefs.getString('email');
    emailController.text=email??"";

  }



  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
    listener: (context, state) async{
      if(state is LoginSuccess)
        {
          SharedPreferences prefs =await SharedPreferences.getInstance();
          user=state.responseUser;
          prefs.setString('token', user.token??"");
          prefs.setString('username', user.username!);
          prefs.setString('user_id', user.id!);
          prefs.setString('password', passwordController.text);
          setState(() {
            loading=false;
          });

          Navigator.pushNamedAndRemoveUntil(context, HomeMain.routename, (Route<dynamic> route) => false);

        }
    else if(state is LoginFailed)
        {
          setState(() {
            loading=false;
          });

        }else if(state is LoginLoading)
          {

          }
    },
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background2,
        leading: IconButton(onPressed: (){
          Navigator.pushNamedAndRemoveUntil(context, OnBoardingScreen.routename, (Route<dynamic> route) => false);
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
        body: ListView(

          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
             Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.login,
                  style: const TextStyle(fontSize: 30, color: AppColors.green),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      color: AppColors.softWhite,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35, top: 90),
                    child: Form(
                      child: Column(
                        children: [
                          Customtextinput(
                            hintText: AppLocalizations.of(context)!.email,
                            controller: emailController,
                            secure: false,
                            icon: const Icon(Icons.person),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Customtextinput(
                              hintText:AppLocalizations.of(context)!.pass,
                              controller: passwordController,
                              secure: secure,
                              iconPass:IconButton(
                          icon: secure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility_outlined),
                onPressed: () {
                  secure ? secure = false : secure = true;
                  setState(() {});
                },
              ),
                              icon: IconButton(
                                icon: const Icon(Icons.lock),
                                onPressed: () {},
                              )
                          ),
                          const SizedBox(height: 35),
                          CustomButton(0.6, AppColors.green, AppLocalizations.of(context)!.login,
                              AppColors.white, () {
                                setState(() {
                                  loading=true;
                                });
                                BlocProvider.of<LoginBloc>(context).add(LoginEvents(email: emailController.text, password: passwordController.text));
                              }, 16,FontWeight.bold),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.6,
                            child: const Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.green,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("OR",style: TextStyle(color: AppColors.green),),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                           performAuthentication(context);
                        } else if (state is LoginFailed) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Login Information Missing"),
                                content: Text("Both your email and password are required to proceed. Please enter them to log in."),
                              );
                            },
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(child: CircularProgressIndicator()); // Show loading indicator while login is in progress
                        }
                        return GestureDetector(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            String? email = prefs.getString('email');
                            String? password = prefs.getString('password');
                            print("sssss $email $password");


                            BlocProvider.of<LoginBloc>(context).add(LoginEvents(email: email!, password: password!));

                          // You can show a loading indicator here as well
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 57,
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
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.fingerprint,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )

                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
  Future<void> performAuthentication(BuildContext context) async {
    try {
      bool isAuthenticated = await LocalAuth.authenticate();
      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, HomeMain.routename);
      } else {
        print('Authentication failed or canceled');
      }
    } catch (e) {
      print('Error during authentication: $e');
    }
  }

}

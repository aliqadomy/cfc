
import 'package:cfc_main/presintation/auth/regestration/regestration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/appColor.dart';
import '../../commonWidget/button.dart';
import '../../commonWidget/customTextInput.dart';
import '../../home/mainHome/mainHome.dart';

class RegestrationBorrowerscreen extends StatefulWidget {
  const RegestrationBorrowerscreen({Key? key}) : super(key: key);
  static const routename = "/regestrationScreen";

  @override
  State<RegestrationBorrowerscreen> createState() => _RegestrationBorrowerscreenState();
}

class _RegestrationBorrowerscreenState extends State<RegestrationBorrowerscreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController country_code = TextEditingController();

  TextEditingController registration_type = TextEditingController();
  bool secure = true;

  bool secureConfirm = true;

  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
      ),
        body: ListView(
      children: [
        BlocListener<RegestrationBloc, RegestrationState>(
  listener: (context, state) {
   if(state is RegestrationBorrowerSuccess)
     {
       Navigator.pushNamed(context, HomeMain.routename);
     }
   else if(state is RegestrationBorrowerFailed)
       {
         ShowToastWidget.showToast(state.errMsg!);
       }else
         {

         }
  },
  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Column(
                    children: [
                      Text(
                       AppLocalizations.of(context)!.borrReg ,
                        style: const TextStyle(color: AppColors.green, fontSize: 25),
                      ),
                      Text(
                        AppLocalizations.of(context)!.noteRegBrr ,
                        style: const TextStyle(fontSize: 14, color: AppColors.blue),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.73,
                        decoration: BoxDecoration(
                            color: AppColors.softWhite,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 35, right: 35, top: 40),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Customtextinput(
                                  hintText: AppLocalizations.of(context)!.fullName,
                                  controller: username,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your  name';
                                    }
                                    return null;
                                  },
                                  secure: false,
                                  icon: const Icon(Icons.person),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Customtextinput(
                                  hintText: AppLocalizations.of(context)!.email,
                                  controller: emailController,
                                  secure: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }

                                    final emailRegex = RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                    );
                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  icon: const Icon(Icons.email_outlined),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Customtextinput(
                                  hintText: AppLocalizations.of(context)!.mobNum,
                                  controller: mobileNumber,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    }
                                    if (!value.startsWith('05')) {
                                      return 'Mobile number must start with 05********';
                                    }
                                    if (value.length != 10) {
                                      return 'Mobile number must be 10 digits long';
                                    }
                                    return null; // Return null if validation passes
                                  },
                                  secure: false,
                                  icon: const Icon(Icons.phone),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Customtextinput(
                                    hintText: AppLocalizations.of(context)!.pass,
                                    controller: passwordController,
                                    secure: secure,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }

                                      if (value.length < 8) {
                                        return "password must be greater than 8 digits ";
                                      }
                                      return null; // Return null if validation passes
                                    },
                                    icon: IconButton(

                                      icon: secure
                                          ? const Icon(Icons.lock)
                                          : const Icon(Icons.lock_open),
                                      onPressed: () {
                                        secure ? secure = false : secure = true;
                                        setState(() {});
                                      },
                                    )),
                                const SizedBox(
                                  height: 35,
                                ),
                                Customtextinput(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value != passwordController.text) {
                                        return 'password does not  match';
                                      }
                                      if (value.length < 8) {
                                        return "password must be greater than 8 digits ";
                                      }
                                      return null;
                                    },
                                    hintText: AppLocalizations.of(context)!.conPass,
                                    controller: confirmPasswordController,
                                    secure: secureConfirm,
                                    icon: IconButton(
                                      icon: secureConfirm
                                          ? const Icon(Icons.lock)
                                          : const Icon(Icons.lock_open),
                                      onPressed: () {
                                        secureConfirm
                                            ? secureConfirm = false
                                            : secureConfirm = true;
                                        setState(() {});
                                      },
                                    )),
                                const SizedBox(height: 15),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Checkbox(
                                   value: isChecked,
                                   onChanged: (bool? value) {
                                     setState(() {

                                       isChecked = value!;
                                     });
                                   },
                                 ),
                                 Text(AppLocalizations.of(context)!.termCondAgree,style: const TextStyle(fontSize: 10,color:AppColors.gray ),),

                             ],),
                                const SizedBox(height: 10),
                                CustomButton(AppColors.green, AppLocalizations.of(context)!.reg,
                                    AppColors.white, () {
                                  if(_formKey.currentState!.validate())
                                    {
                                      BlocProvider.of<RegestrationBloc>(context).add(ResgestrationBorrowerEvent(email: emailController.text, username: username.text, name: username.text, password: passwordController.text, role_type: "3", country_code:"+966" , mobile_number: mobileNumber.text, registration_type:"2" ));
                                    }

                                    }, 14,FontWeight.bold)
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
),
      ],
    ));
  }
}

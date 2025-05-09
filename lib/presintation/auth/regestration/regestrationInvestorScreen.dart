import 'package:cfc_main/presintation/auth/regestration/regestration_bloc.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/appColor.dart';
import '../../commonWidget/button.dart';
import '../../commonWidget/customTextInput.dart';
import '../../home/mainHome/mainHome.dart';
import 'countryCode.dart';

class RegestationInvestorScreen extends StatefulWidget {
  RegestationInvestorScreen({Key? key}) : super(key: key);
  static const routename = "/regestrationBorrowerScreen";

  @override
  State<RegestationInvestorScreen> createState() =>
      _RegestationInvestorScreenState();
}

enum SingingCharacter { company, individual }

class _RegestationInvestorScreenState extends State<RegestationInvestorScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController country_code = TextEditingController();

  TextEditingController registration_type = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool secure = true;

  String message="";

  bool secureConfirm = true;

  bool isChecked = false;

  var user;

  int type=1;

  SingingCharacter? _character = SingingCharacter.individual;

  String selectedCountryCode = '+966';

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
          if(state is RegestrationInvestorSuccess)
            {
              Future.delayed(const Duration(seconds: 1));
              Navigator.pushNamed(context, HomeMain.routename);
            }else if(state is RegestrationInvestorFailed){
            ShowToastWidget.showToast(state.errMsg!);
          }else

            {

            }
        },
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.invReg,
                    style: const TextStyle(color: AppColors.green, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 5),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.87,
                        decoration: BoxDecoration(
                            color: AppColors.softWhite,
                            borderRadius: BorderRadius.circular(16)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 190,
                                    child: ListTile(
                                      title: Text(
                                          AppLocalizations.of(context)!.company,
                                          style: TextStyle(fontSize: 13)),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.company,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            value==SingingCharacter.individual?type=1:type=2;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    child: ListTile(
                                      title: Text(
                                        AppLocalizations.of(context)!.individual,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.individual,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  children: [
                                    Customtextinput(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                      hintText:
                                          AppLocalizations.of(context)!.fullName,
                                      controller: username,
                                      secure: false,
                                      icon: const Icon(Icons.person),
                                    ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Customtextinput(
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
                                      hintText: AppLocalizations.of(context)!.email,
                                      controller: emailController,
                                      secure: false,
                                      icon: const Icon(Icons.email_outlined),
                                    ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      children: [
                                        CountryCodeDropdown(
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedCountryCode = newValue;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Customtextinput(
                                            hintText: AppLocalizations.of(context)!.mobNum,
                                            controller: mobileNumber,
                                            secure: false,
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your mobile number';
                                              }
                                              if (value.length != 10) {
                                                return 'Mobile number must be 10 digits long';
                                              }
                                              return null;
                                            },
                                            icon: const Icon(Icons.phone),
                                          ),
                                        ),
                                      ],
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
                                        iconPass:IconButton(
                                          icon: secure
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility_outlined),
                                          onPressed: () {
                                            secure ? secure = false : secure = true;
                                            setState(() {});
                                          },
                                        ),
                                        icon: const Icon(Icons.lock)
                                        ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Customtextinput(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          if (value != passwordController.text) {
                                            return 'password does not match';
                                          }
                                          if (value.length < 8) {
                                            return "password must be greater than 8 digits ";
                                          }
                                          return null;
                                        },
                                        hintText:
                                            AppLocalizations.of(context)!.conPass,
                                        controller: confirmPasswordController,
                                        secure: secureConfirm,
                                        iconPass:IconButton(
                                          icon: secureConfirm
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility_outlined),
                                          onPressed: () {
                                            secureConfirm
                                                ? secureConfirm = false
                                                : secureConfirm = true;
                                            setState(() {});
                                          },
                                        ),
                                        icon: const Icon(Icons.lock),),

                                    const SizedBox(height: 15),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        TextButton(
                                          onPressed: (){
                                            //ResgestrationTermsEvent
                                            BlocProvider.of<RegestrationBloc>(context).add(ResgestrationTermsEvent());
                                            showModalBottomSheet<void>(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (innerContext) {
                                                return
                                                  SizedBox(
                                                    height: 500,
                                                    child: StatefulBuilder(builder: (innerContext, StateSetter setState) {
                                                      return BlocProvider.value(
                                                        value: context.read<RegestrationBloc>(),
                                                        child: BlocListener<RegestrationBloc, RegestrationState>(
                                                          listener: (context, state) {
                                                            if (state is RegestrationTermsSuccess) {
                                                              String text = removeHtmlTags(state.message);
                                                              final List<String> terms = text.split('\n').where((line) => line.isNotEmpty).toList();
                                                              message = terms.join('\n'); // Join the list back into a single string with line breaks

                                                              setState(() {});
                                                            } else if (state is RegestrationBorrowerFailed) {
                                                              ShowToastWidget.showToast("SomeThing Wrong !");
                                                            } else {
                                                              const Center(child: CircularProgressIndicator());
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 10,right: 20,top: 20),
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  const Text(
                                                                   "الشروط والاحكام",
                                                                    style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.w600),
                                                                  ),
                                                                                                                        Padding(
                                                              padding: const EdgeInsets.all(16.0),
                                                              child: SingleChildScrollView(
                                                                child: Text(
                                                                  message,
                                                                    textDirection: TextDirection.rtl,
                                                                  style: const TextStyle(fontSize: 16.0, height: 1.5,letterSpacing: 1.3,fontFamily: "Tomorrow"),
                                                                ),
                                                              ),
                                                                                                                        )],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );

                                              },
                                            ).then((value) {});
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)!.termCondAgree,
                                            style: const TextStyle(
                                                fontSize: 13, color: Colors.red,decoration: TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
                                    if (!isChecked)
                                      Text(
                                        AppLocalizations
                                        .of(context)!.terms,
                                        style: TextStyle(color: Colors.red,fontSize: 13),
                                      ),
                                    const SizedBox(height: 30),
                                    CustomButton(

                                        AppColors.green,
                                        AppLocalizations.of(context)!.reg,
                                        AppColors.white,
                                        () {
                                          if(_formKey.currentState!.validate())
                                            {
                                              if (isChecked){
                                                BlocProvider.of<RegestrationBloc>(context).add(ResgestrationInvestorEvent(email: emailController.text, username: username.text, name: username.text, password: passwordController.text, role_type: "2", country_code:"+966" , mobile_number: mobileNumber.text, registration_type:type.toString() ));

                                              }

                                            }
                                        },
                                        14,FontWeight.bold)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
        ),
            ],
          ));
  }
  String removeHtmlTags(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body?.text ?? 'sss';
  }
}

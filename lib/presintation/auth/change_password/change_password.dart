import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/appColor.dart';
import '../../commonWidget/CutsomButton.dart';
import '../../commonWidget/customTextInput.dart';
import '../login/screen/login.dart';
import 'change_password_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static const routename = "/changePassword";

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  bool loading = false;
  bool secure = true;
  bool secureTwo = true;
  final _formKey = GlobalKey<FormState>();

  //secureTwo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background2,
        actions: [
          Padding(
              padding: const EdgeInsetsDirectional.only(end: 27),
              child: Image.asset(
                'assets/images/logo2.png',
                width: 111,
                height: 50,
              ))
        ],
      ),
      backgroundColor: AppColors.background2,
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if(state is ChangePasswordSuccess)
            {
              ShowToastWidget.showToast("Password Changed");
              Future.delayed(const Duration(seconds: 2));
              Navigator.pushNamedAndRemoveUntil(context,LoginScreen.routename, (Route<dynamic> route) => false);
            }
          else if(state is ChangePasswordFailed)
            {
              ShowToastWidget.showToast(state.errMsg);
            }else
              {
                 const CircularProgressIndicator();
              }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text(AppLocalizations.of(context)!.changePassword,
                  style: const TextStyle(color: AppColors.black, fontSize: 20),),
                const SizedBox(height: 50),
                SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                child:
                Customtextinput(
                    hintText: AppLocalizations.of(context)!.currentPass,
                    controller: oldPasswordController,
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
                    icon: const Icon(
                       Icons.lock,
                    )
                )),
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.07,
                  child: Customtextinput(
                      hintText:AppLocalizations.of(context)!.pass,
                      controller: passwordController,
                      secure: secureTwo,
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
                        icon: secureTwo
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility_outlined),
                        onPressed: () {
                          secureTwo ? secureTwo = false : secureTwo = true;
                          setState(() {});
                        },
                      ),
                      icon: const Icon(Icons.lock),
            
                  ),
                ),
                const SizedBox(height: 30),
            
                CustomButton(
            
                  onTap: () {
    if(_formKey.currentState!.validate())
    {

      BlocProvider.of<ChangePasswordBloc>(context).add(ChangePasswordEvents(oldPass: oldPasswordController.text, newPass: passwordController.text));
      setState(() {
        loading = true;
      });
    }

                  },
                  colors: AppColors.green,
                  title: AppLocalizations.of(context)!.changePassword,)
            
              ],
            ),
          ),
        ),
      ),
    );
  }

}

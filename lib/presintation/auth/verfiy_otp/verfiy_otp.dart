import 'package:cfc_main/infrastructure/data_soruce/auth/otpProvider.dart';
import 'package:cfc_main/infrastructure/repository/otpRepo.dart';
import 'package:cfc_main/presintation/auth/change_password_otp/changePasswordOtp.dart';
import 'package:cfc_main/presintation/auth/verfiy_otp/verfiy_otp_bloc.dart';
import 'package:cfc_main/presintation/commonWidget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/appColor.dart';

class VerfiyOtp extends StatefulWidget {
  const VerfiyOtp({super.key});
  static const routename = '/verify-otp';

  @override
  State<VerfiyOtp> createState() => _VerfiyOtpState();
}

class _VerfiyOtpState extends State<VerfiyOtp> {
  String _enteredOtp = '';
  bool isLoading = false;

  // Focus nodes for each field
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  void _verifyOtp(String otp) {
  // Do your OTP verification here
  print("Entered OTP: $otp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white, // Optional: set consistent background
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // uniform side padding
            child: BlocListener<VerfiyOtpBloc, VerfiyOtpState>(
    listener: (context, state) {
      if(state is VerifyOtpSuccess)
        {
          setState(() {
            isLoading=false;
          });

          Navigator.of(context).pushNamed(ChangePasswordOtp.routename);

        }else if(state is VerifyOtpFailed)
          {
            ShowToastWidget.showToast(state.msg);
            setState(() {
              isLoading=false;
            });
          }else
            {
              setState(() {
                isLoading=true;
              });
            }
    },
    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // left-align text
              children: [
                 Text(
                  AppLocalizations.of(context)!.vOtp,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                 Text(
                  AppLocalizations.of(context)!.checkNumerOtp,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: OtpTextField(
                      autoFocus: true,
                      fieldWidth: 50,
                      fieldHeight: 55,
                      numberOfFields: 4,
                      borderRadius: BorderRadius.circular(8),
                      keyboardType: TextInputType.number,
                      focusedBorderColor: AppColors.green,
                      borderWidth: 2.0,
                      disabledBorderColor: AppColors.green.withOpacity(0.4),
                      enabledBorderColor: AppColors.green,
                      borderColor: AppColors.green,
                      showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          if (code.length == 1) {
                            // Move focus to the next field when the current field is filled
                            if (focusNode1.hasFocus) {
                              FocusScope.of(context).requestFocus(focusNode2);
                            } else if (focusNode2.hasFocus) {
                              FocusScope.of(context).requestFocus(focusNode3);
                            } else if (focusNode3.hasFocus) {
                              FocusScope.of(context).requestFocus(focusNode4);
                            }
                          }
                        },
                      onSubmit: (String verificationCode) {
                        _enteredOtp = verificationCode;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                isLoading?
                    const CircularProgressIndicator(color: AppColors.green,)
                    :Center(
                  child: CustomButton(
                    AppColors.green,
                    AppLocalizations.of(context)!.fPass,
                    AppColors.white,
                        ()async{
                      SharedPreferences prefs=await SharedPreferences.getInstance();
                      var email = prefs.getString('email');
                      if (_enteredOtp.length == 4) {
                     BlocProvider.of<VerfiyOtpBloc>(context).add(VerifyOtp(email:email!,otp: _enteredOtp ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(AppLocalizations.of(context)!.checkNumerOtp)),
                        );
                      }
                    },
                    17,
                    FontWeight.w600,

                  ),
                ),
              ],
            ),
    ),
          ),
        ),
      );
  }
}

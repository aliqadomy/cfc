import 'package:cfc_main/presintation/commonWidget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/appColor.dart';
import '../../../commonWidget/customTextInput.dart';
import '../verfiy_otp.dart';
import '../verfiy_otp_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpDialog extends StatefulWidget {
  final TextEditingController emailController;

  const OtpDialog({super.key, required this.emailController});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  bool otpLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(AppLocalizations.of(context)!.enterEmail),
      content: SizedBox(
        height: 150,
        child: BlocListener<VerfiyOtpBloc, VerfiyOtpState>(
          listener: (context, state)async {
            if (state is SendOtpSuccess){
              SharedPreferences prefs =await SharedPreferences.getInstance();
              prefs.setString('email',widget.emailController.text);
              setState(() {
                otpLoading = false;
                Navigator.of(context).pushNamed(VerfiyOtp.routename);

              });

            } else if (state is SendOtpFailed) {
              setState(() {
                otpLoading = false;
              });
              Navigator.pop(context);
              ShowToastWidget.showToast(AppLocalizations.of(context)!.otpFailed);
            } else {
              setState(() {
                otpLoading = true;
              });
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Customtextinput(
                  hintText: AppLocalizations.of(context)!.enterEmail,
                  secure: false,
                  controller: widget.emailController,
                ),
                const SizedBox(height: 20),
                otpLoading
                    ? const CircularProgressIndicator(color: AppColors.green)
                    : CustomButton(
                  AppColors.green,
                  AppLocalizations.of(context)!.submit,
                  AppColors.white,
                      () {
                    setState(() {
                      otpLoading=true;
                    });
                    BlocProvider.of<VerfiyOtpBloc>(context).add(
                      SendOtp(email: widget.emailController.text),
                    );
                  },
                  17,
                  FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
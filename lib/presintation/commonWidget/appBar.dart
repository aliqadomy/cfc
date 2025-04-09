// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../auth/login/screen/login.dart';
import '../visitor/visitorScreen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool backIcon=false;
   CustomAppBar({
    this.backIcon=false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 200,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: backIcon
          ? Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 25,
                ),
              ),

              GestureDetector(
                  onTap:(){
                    Navigator.pushNamed(context, Visitorscreen.routename);
                  }

                  ,child: Image.asset("assets/images/help.png")),
            ],
          )
          : Row(
            children: [
              IconButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: const Icon(
                  Icons.power_settings_new,
                  size: 25,
                ),
              ),
              GestureDetector(
                  onTap:(){
                    Navigator.pushNamed(context, Visitorscreen.routename);
                  }

                  ,child: Image.asset("assets/images/help.png")),
            ],
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Image.asset(
            'assets/images/new logo.png',
            width: 111,
            height: 50,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routename, // Replace with your login route name
          (Route<dynamic> route) => false, // Remove all previous routes
    );  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(AppLocalizations.of(context)!.logout),
          content:  Text(AppLocalizations.of(context)!.logout_sure),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child:  Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logout(context); // Perform logout action
              },
              child:  Text(AppLocalizations.of(context)!.logout),
            ),
          ],
        );
      },
    );
  }
}

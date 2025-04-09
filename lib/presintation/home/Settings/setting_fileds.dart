import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/appColor.dart';

class SettingFileds extends StatelessWidget {
  SettingFileds(
      {required this.title,
       this.icon=const SizedBox(),
       this.mainButton=const SizedBox(),
      super.key});

  String? title;

  Widget icon;


  Widget mainButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                const SizedBox(width: 10,),
                Text(title!),

              ],
            ),
            mainButton,
          ],
        ),
      ),
    );
  }
}

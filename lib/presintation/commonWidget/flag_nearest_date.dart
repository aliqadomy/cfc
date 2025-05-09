import 'package:cfc_main/domain/model/nearestDateModel.dart';
import 'package:flutter/material.dart';

import '../../core/appColor.dart';

class NearestDateFlag extends StatelessWidget {
  NearestDateFlag({
    Key? key,
    this.nearestDateModel,
    required this.title,
    this.haveSign = false,
  });

  final dynamic nearestDateModel;
  String title;
  bool haveSign;

  @override
  Widget build(BuildContext context) {
    final double textScale =
    MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only( bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5,bottom: 10,top: 5),
            width: screenWidth*0.45,
            color: AppColors.softWhite,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                textScaleFactor: textScale,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 3,
            height: 2,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 10,bottom: 10,top: 5),
            width: screenWidth*0.30,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${nearestDateModel ?? "0"}",
                  textAlign: TextAlign.center,
                  textScaleFactor: textScale,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                haveSign
                    ? AppColors.saudiSign(AppColors.black)
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

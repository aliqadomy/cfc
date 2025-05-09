import 'package:flutter/material.dart';
import '../../core/appColor.dart';

class FlagCard extends StatelessWidget {
  FlagCard({
    @required this.titleOne,
    @required this.titleTwo,
    required this.index,
    required this.signValue,
  });

  String? titleOne;
  String? titleTwo;
  int index;
  bool signValue = false;

  @override
  Widget build(BuildContext context) {
    final double textScale =
    MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenWidth * 0.12,
            child: Image.asset(
              index == 0
                  ? "assets/images/total_profit.png"
                  : index == 1
                  ? "assets/images/totoal_invest.png"
                  : "assets/images/num_invest.png",
              fit: BoxFit.contain,
            ),
          ),

          // Title Two (small text)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              titleTwo ?? "",
              style: TextStyle(
                fontSize: screenWidth * 0.035, // responsive font size
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              textScaleFactor: textScale,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleOne ?? "",
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: AppColors.green,
                  fontWeight: FontWeight.w500,
                ),
                textScaleFactor: textScale,
              ),
              const SizedBox(width: 5),
              signValue ? AppColors.saudiSign(Colors.green) : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

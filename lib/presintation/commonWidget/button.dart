
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
   CustomButton(this.color,this.text,this.textButtonColor,this.onTap,this.textSize, this.fontWeight, {super.key});

   double? textSize=25;
  Color? color;
  FontWeight? fontWeight=FontWeight.w500;
  String? text;
  Color? textButtonColor;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        width: MediaQuery.of(context).size.width*0.70,
        decoration: BoxDecoration(color: color??Colors.white,borderRadius: BorderRadius.circular(24)),
        child: Center(
          child: Text(text!,style: TextStyle(
            fontSize: textSize,
            color:textButtonColor,fontFamily: 'Almarai',
              fontWeight: fontWeight
          ),),
        ),
      
      ),
    );
  }
}

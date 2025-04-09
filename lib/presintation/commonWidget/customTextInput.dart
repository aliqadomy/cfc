import 'package:flutter/material.dart';

import '../../core/appColor.dart';

class Customtextinput extends StatefulWidget {
  Customtextinput(
      {super.key,
      required this.hintText,
       this.controller,
      required this.secure,
      this.readOnly = false,
      this.iconPass = const SizedBox(
        width: 0,
        height: 0,
      ),
      this.icon = const SizedBox(
        width: 0,
        height: 0,
      ),
      this.keyboardType = TextInputType.text,
      this.validator,
      this.onPress});

  Widget icon;
  Widget iconPass;
  String? hintText;
  bool secure = false;
  bool disableIcon = false;
  bool readOnly = false;
  TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  VoidCallback? onPress;
  @override
  State<Customtextinput> createState() => _CustomtextinputState();
}

class _CustomtextinputState extends State<Customtextinput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: TextFormField(
        onTap: widget.onPress,
        autofocus: true,
        readOnly: widget.readOnly,
        style: const TextStyle(fontSize: 16),
        controller: widget.controller,
        obscureText: widget.secure,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          suffixIcon: widget.iconPass,
          suffixIconColor: Colors.black,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          hintMaxLines: 1,
          hintFadeDuration: const Duration(seconds: 1),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/appColor.dart';

class Customtextinput extends StatefulWidget {
  Customtextinput({
    super.key,
    required this.hintText,
    this.controller,
    required this.secure,
    this.readOnly = false,
    this.iconPass = const SizedBox(width: 0, height: 0),
    this.icon = const SizedBox(width: 0, height: 0),
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onPress,
  });

  final Widget icon;
  final Widget iconPass;
  final String? hintText;
  final bool secure;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onPress;

  @override
  State<Customtextinput> createState() => _CustomtextinputState();
}

class _CustomtextinputState extends State<Customtextinput> {
  @override
  Widget build(BuildContext context) {
    // Clamp text scale factor so it doesn't get too large
    final double clampedTextScale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);

    return GestureDetector(
      onTap: widget.onPress,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: clampedTextScale),
        child: SizedBox(
          width: double.infinity,
          child: TextFormField(
            onTap: widget.onPress,
            autofocus: true,
            readOnly: widget.readOnly,
            controller: widget.controller,
            obscureText: widget.secure,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            style: const TextStyle(fontSize: 16),
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
        ),
      ),
    );
  }
}

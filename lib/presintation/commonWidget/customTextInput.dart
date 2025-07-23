import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/appColor.dart';

class Customtextinput extends StatefulWidget {
  const Customtextinput({
    super.key,
    required this.hintText,
    this.controller,
    required this.secure,
    this.readOnly = false,
    this.iconPass,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onPress,
    this.showPrefixIcon = true,
  });

  final Widget? icon;
  final Widget? iconPass;
  final String? hintText;
  final bool secure;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onPress;
  final bool showPrefixIcon;

  @override
  State<Customtextinput> createState() => _CustomtextinputState();
}

class _CustomtextinputState extends State<Customtextinput> {
  @override
  Widget build(BuildContext context) {
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
              prefixIcon: widget.showPrefixIcon ? widget.icon : null,
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

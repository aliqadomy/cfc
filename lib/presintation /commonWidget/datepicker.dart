import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    super.key,
    required this.hintText,
    required this.controller,
    this.onPress,
  });

   final String? hintText;
   final TextEditingController controller;
   final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Calls the onPress function (which will be _selectDate)
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding for button look
        decoration: BoxDecoration(
          color: Colors.blue, // Button background color
          borderRadius: BorderRadius.circular(16), // Rounded corners
          border: Border.all(color: Colors.blue), // Border color
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white), // White hint text for the button look
            border: InputBorder.none, // No border inside the field
            contentPadding: EdgeInsets.zero, // Remove padding inside the input field
            isDense: true, // Compact text field
            suffixIcon: Icon(
              Icons.calendar_today, // Calendar icon to represent date selection
              color: Colors.white,
            ),
          ),
          style: TextStyle(color: Colors.white), // Text color for the selected date
          readOnly: true, // Prevent typing, since it's a button
        ),
      ),
    );
  }
}
